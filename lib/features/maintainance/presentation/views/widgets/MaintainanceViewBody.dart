import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medtech_mobile/core/widgets/show_err_dialog.dart';
import 'package:medtech_mobile/core/widgets/showsuccessDialog.dart';

import '../../../../main/presentaion/views/main_view.dart';
import '../../../domain/repo/miantainance_repo.dart';
import '../../cubits/cubit/request_maintainance_cubit.dart';

class MaintainanceViewBody extends StatefulWidget {
  const MaintainanceViewBody({super.key, required this.productId});
  final String productId;

  @override
  State<MaintainanceViewBody> createState() => _MaintainanceViewBodyState();
}

class _MaintainanceViewBodyState extends State<MaintainanceViewBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _issueController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  DateTime? _selectedDateTime;

  @override
  void dispose() {
    _issueController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _pickDateTime(BuildContext context) async {
    final now = DateTime.now();

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime ?? now,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(
            context,
          ).copyWith(colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal)),
          child: child!,
        );
      },
    );

    if (pickedDate == null) return;

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedDateTime ?? now),
      builder: (context, child) {
        return Theme(
          data: Theme.of(
            context,
          ).copyWith(colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal)),
          child: child!,
        );
      },
    );

    final dt = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime?.hour ?? 0,
      pickedTime?.minute ?? 0,
    );

    setState(() {
      _selectedDateTime = dt.toUtc();
      // الشكل المطلوب: yyyy-MM-ddTHH:mm:ss.000Z
      _dateController.text = DateFormat(
        "yyyy-MM-dd'T'HH:mm:ss.000'Z'",
      ).format(_selectedDateTime!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RequestMaintainanceCubit, RequestMaintainanceState>(
      listener: (context, state) {
        if (state is RequestMaintainanceLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        } else {
          // سكّر أي دايلوج مفتوح
          if (Navigator.canPop(context)) Navigator.pop(context);
        }

        if (state is RequestMaintainanceFailure) {
          showerrorDialog(
            context: context,
            title: "Error",
            description: state.errMessage,
          );
        }

        if (state is RequestMaintainanceSuccess) {
          showsuccessDialog(
            context: context,
            title: "Success",
            description: "Maintainance request sent.",
            btnOkOnPress:
                () =>
                    Navigator.pushReplacementNamed(context, MainView.routeName),
          );
        }
      },
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE6FFFA), Color(0xFFFFFFFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // هيدر لطيف
                _Header(productId: widget.productId),

                const SizedBox(height: 16),

                // الكارد الأساسي
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Maintenance details',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 12),

                          // Issue field
                          TextFormField(
                            controller: _issueController,
                            minLines: 2,
                            maxLines: 5,
                            textInputAction: TextInputAction.newline,
                            decoration: InputDecoration(
                              labelText: 'Describe the issue',
                              prefixIcon: const Icon(
                                Icons.build_circle_outlined,
                              ),
                              hintText: 'e.g., Unusual noise, not powering on…',
                              filled: true,
                              fillColor: Colors.grey.shade50,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            validator: (v) {
                              if (v == null || v.trim().isEmpty) {
                                return 'Please describe the issue';
                              }
                              if (v.trim().length < 6) {
                                return 'Add a bit more details';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 12),

                          // Date & time
                          TextFormField(
                            controller: _dateController,
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: 'Preferred date & time',
                              prefixIcon: const Icon(Icons.event_outlined),
                              suffixIcon: IconButton(
                                onPressed: () => _pickDateTime(context),
                                icon: const Icon(Icons.schedule),
                                tooltip: 'Pick date & time',
                              ),
                              hintText: 'Tap to choose',
                              filled: true,
                              fillColor: Colors.grey.shade50,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onTap: () => _pickDateTime(context),
                            validator: (v) {
                              if (_selectedDateTime == null) {
                                return 'Please select date & time';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 20),

                          // زر الإرسال
                          SizedBox(
                            height: 52,
                            child: FilledButton.icon(
                              icon: const Icon(Icons.send_rounded),
                              onPressed: () async {
                                if (!_formKey.currentState!.validate()) return;

                                final cubit =
                                    context.read<RequestMaintainanceCubit>();
                                await cubit.requestMaintainance(
                                  id: widget.productId,
                                  issue: _issueController.text.trim(),
                                  date: _dateController.text.trim(),
                                );
                              },
                              label: const Text(
                                'Request Maintenance',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              style: FilledButton.styleFrom(
                                backgroundColor: Colors.teal,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // ملاحظة بسيطة
                _TipCard(
                  text:
                      'Tip: choose a time when the device is available and not in active use.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 18, 14, 18),
      decoration: BoxDecoration(
        color: Colors.teal.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.teal.shade100),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.teal.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.miscellaneous_services_rounded, size: 28),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Maintenance request',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Product ID: $productId',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.teal.shade700,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TipCard extends StatelessWidget {
  const _TipCard({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFEFFCF9),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: Colors.teal.shade100),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            const Icon(Icons.info_outline),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(height: 1.3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
