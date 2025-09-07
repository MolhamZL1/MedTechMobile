import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:medtech_mobile/core/services/get_it_service.dart';
import 'package:medtech_mobile/features/contracts/domain/entity/contract_entity.dart';
import 'package:medtech_mobile/features/contracts/presentation/cubits/extend contract/extend_contract_cubit.dart';
import '../../domain/repo/contracts_repo.dart';

class ContractDetailsView extends StatelessWidget {
  const ContractDetailsView({super.key, required this.contractEntity});
  final ContractEntity contractEntity;
  static const String routeName = '/ContractDetailsView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contract #${contractEntity.contractNumber}')),
      body: BlocProvider(
        create: (context) => ExtendContractCubit(getIt.get<ContractsRepo>()),
        child: ContractDetailsViewBody(contractEntity: contractEntity),
      ),
    );
  }
}

class ContractDetailsViewBody extends StatefulWidget {
  const ContractDetailsViewBody({super.key, required this.contractEntity});
  final ContractEntity contractEntity;

  @override
  State<ContractDetailsViewBody> createState() =>
      _ContractDetailsViewBodyState();
}

class _ContractDetailsViewBodyState extends State<ContractDetailsViewBody> {
  DateTime? _pickedUtc;

  String _d(DateTime d) => DateFormat('yyyy-MM-dd').format(d);
  Color _statusColor(String s) {
    final t = s.toLowerCase();
    if (t.contains('active') || t.contains('approved')) return Colors.green;
    if (t.contains('pending')) return Colors.amber;
    if (t.contains('cancel') || t.contains('reject')) return Colors.red;
    if (t.contains('completed') || t.contains('ended')) return Colors.blueGrey;
    return Colors.teal;
  }

  Future<void> _pickDateTime(BuildContext context) async {
    final now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(2050),
      builder:
          (c, child) => Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
            ),
            child: child!,
          ),
    );
    if (date == null) return;

    final time = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 9, minute: 0),
      builder:
          (c, child) => Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
            ),
            child: child!,
          ),
    );
    final dtLocal = DateTime(
      date.year,
      date.month,
      date.day,
      time?.hour ?? 0,
      time?.minute ?? 0,
    );
    setState(() => _pickedUtc = dtLocal.toUtc());
  }

  String _formatUtcForApi(DateTime utc) =>
      DateFormat("yyyy-MM-dd'T'HH:mm:ss.000'Z'").format(utc);

  @override
  Widget build(BuildContext context) {
    final c = widget.contractEntity;

    return BlocListener<ExtendContractCubit, ExtendContractState>(
      listener: (context, state) async {
        if (state is ExtendContractLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        } else {
          // سكّر أي دايلوج مفتوح
          if (Navigator.canPop(context)) Navigator.pop(context);
        }
        if (state is ExtendContractSucsess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Contract extended successfully.')),
          );
        }
        if (state is ExtendContractFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // كارد أساسي
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                    color: Colors.black.withOpacity(0.06),
                  ),
                ],
                border: Border.all(
                  color: Theme.of(context).dividerColor.withOpacity(.25),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Thumb(imageUrl: c.productImage),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // عنوان + شارة حالة
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  c.productName,
                                  style: Theme.of(context).textTheme.titleMedium
                                      ?.copyWith(fontWeight: FontWeight.w800),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: 8),
                              _Chip(
                                text: c.status,
                                color: _statusColor(c.status),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          // رقم الطلب المرتبط (إن حبيت تستخدمه)
                          Row(
                            children: [
                              const Icon(Icons.receipt_long_outlined, size: 16),
                              const SizedBox(width: 6),
                              Flexible(
                                child: Text(
                                  'Order item: ${c.orderItemId}',
                                  style: Theme.of(context).textTheme.bodySmall,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          // التواريخ كبادجات
                          Wrap(
                            spacing: 8,
                            runSpacing: 6,
                            children: [
                              _DatePill(
                                icon: Icons.play_circle_outline,
                                label: 'Start: ${_d(c.startDate)}',
                              ),
                              _DatePill(
                                icon: Icons.stop_circle_outlined,
                                label: 'End: ${_d(c.endDate)}',
                              ),
                              if (c.actualReturnDate != null)
                                _DatePill(
                                  icon: Icons.assignment_turned_in_outlined,
                                  label: 'Returned: ${_d(c.actualReturnDate!)}',
                                ),
                              _DatePill(
                                icon: Icons.gavel_outlined,
                                label: 'Agreed: ${_d(c.agreedToTermsAt)}',
                              ),
                            ],
                          ),
                          if ((c.notes ?? '').trim().isNotEmpty) ...[
                            const SizedBox(height: 12),
                            Text(
                              c.notes!.trim(),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // تمديد العقد
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.teal.withOpacity(.06),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.teal.withOpacity(.15)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.edit_calendar_outlined),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      _pickedUtc == null
                          ? 'Pick a new end date & time (UTC will be sent).'
                          : 'New end (UTC): ${_formatUtcForApi(_pickedUtc!)}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(width: 10),
                  OutlinedButton.icon(
                    onPressed: () => _pickDateTime(context),
                    icon: const Icon(Icons.schedule),
                    label: const Text('Pick'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: FilledButton.icon(
                icon: const Icon(Icons.send_rounded),
                label: const Text(
                  'Extend Contract',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                onPressed: () {
                  if (_pickedUtc == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please pick a date & time'),
                      ),
                    );
                    return;
                  }
                  final formatted = _formatUtcForApi(_pickedUtc!);
                  log('Extending ${c.contractNumber} -> $formatted');
                  context.read<ExtendContractCubit>().extendContract(
                    id: c.id.toString(),
                    newEndDate: formatted,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Thumb extends StatelessWidget {
  const _Thumb({required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 84,
      height: 84,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(.12),
            Theme.of(context).colorScheme.secondary.withOpacity(.08),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder:
              (_, __, ___) =>
                  const Center(child: Icon(Icons.image_not_supported)),
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.text, required this.color});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withOpacity(.25)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w800,
          color: color,
          letterSpacing: .2,
        ),
      ),
    );
  }
}

class _DatePill extends StatelessWidget {
  const _DatePill({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final border = BorderSide(
      color: Theme.of(context).dividerColor.withOpacity(.3),
    );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        border: Border.fromBorderSide(border),
        color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(.25),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
