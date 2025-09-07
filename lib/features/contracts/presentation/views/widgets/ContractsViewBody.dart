import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:medtech_mobile/features/contracts/domain/entity/contract_entity.dart';
import 'package:medtech_mobile/features/contracts/presentation/cubits/get contracts/get_contract_cubit.dart';
import '../contract_details_view.dart';

class ContractsViewBody extends StatelessWidget {
  const ContractsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetContractCubit, GetContractState>(
      builder: (context, state) {
        if (state is GetContractSuccess) {
          if (state.contracts.isEmpty) {
            return const _EmptyContracts();
          }
          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            itemCount: state.contracts.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final contract = state.contracts[index];
              return ContractItem(contract: contract);
            },
          );
        } else if (state is GetContractFailure) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                state.errMessage,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class ContractItem extends StatelessWidget {
  const ContractItem({super.key, required this.contract});
  final ContractEntity contract;

  String _formatDate(DateTime date) => DateFormat('yyyy-MM-dd').format(date);

  // لون الحالة
  Color _statusColor(BuildContext ctx, String status) {
    final s = status.toLowerCase();
    if (s.contains('active') || s.contains('approved')) {
      return Colors.green;
    } else if (s.contains('pending')) {
      return Colors.amber;
    } else if (s.contains('cancel') || s.contains('rejected')) {
      return Colors.red;
    } else if (s.contains('completed') || s.contains('ended')) {
      return Colors.blueGrey;
    }
    return Theme.of(ctx).colorScheme.primary;
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _statusColor(context, contract.status);

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        log('open contract ${contract.contractNumber}');
        Navigator.pushNamed(
          context,
          ContractDetailsView.routeName,
          arguments: contract,
        );
      },
      child: Container(
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
            color: Theme.of(context).dividerColor.withOpacity(0.3),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // الصورة
              _ProductThumb(imageUrl: contract.productImage),

              const SizedBox(width: 12),

              // النصوص
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // العنوان + الحالة
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            contract.productName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(width: 8),
                        _StatusChip(text: contract.status, color: statusColor),
                      ],
                    ),

                    const SizedBox(height: 6),

                    // رقم العقد
                    Row(
                      children: [
                        const Icon(
                          Icons.confirmation_number_outlined,
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        Flexible(
                          child: Text(
                            'Contract #${contract.contractNumber}',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // التواريخ كبادجات
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      children: [
                        _DatePill(
                          icon: Icons.play_circle_outline,
                          label: _formatDate(contract.startDate),
                        ),
                        _DatePill(
                          icon: Icons.stop_circle_outlined,
                          label: _formatDate(contract.endDate),
                        ),
                        if (contract.actualReturnDate != null)
                          _DatePill(
                            icon: Icons.assignment_turned_in_outlined,
                            label: _formatDate(contract.actualReturnDate!),
                          ),
                      ],
                    ),

                    if ((contract.notes ?? '').trim().isNotEmpty) ...[
                      const SizedBox(height: 10),
                      Text(
                        contract.notes!.trim(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                    ],

                    const SizedBox(height: 12),

                    // أزرار صغيرة أسفل الكارد
                    Row(
                      children: [
                        _GhostButton(
                          icon: Icons.picture_as_pdf_outlined,
                          label: 'Document',
                          onPressed: () {
                            // افتح رابط الوثيقة إن وجد
                            // launchUrlString(contract.contractDocumentUrl);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductThumb extends StatelessWidget {
  const _ProductThumb({required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(.12),
            Theme.of(context).colorScheme.secondary.withOpacity(.08),
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
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

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.text, required this.color});
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
          fontWeight: FontWeight.w700,
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

class _GhostButton extends StatelessWidget {
  const _GhostButton({required this.icon, required this.label, this.onPressed});

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final border = BorderSide(
      color: Theme.of(context).dividerColor.withOpacity(.35),
    );
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 36,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.fromBorderSide(border),
          ),
          child: Row(
            children: [
              Icon(icon, size: 18),
              const SizedBox(width: 6),
              Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyContracts extends StatelessWidget {
  const _EmptyContracts();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.assignment_outlined,
              size: 64,
              color: Theme.of(context).hintColor,
            ),
            const SizedBox(height: 12),
            Text(
              'No contracts yet',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              'Once you rent a product, your contract will appear here.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).hintColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
