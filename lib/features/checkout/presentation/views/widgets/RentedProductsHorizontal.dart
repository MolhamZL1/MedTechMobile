import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cart/domain/entities/cart_item_entity.dart';
import '../../../data/model/RentalPeriod.dart';
import '../../cubits/cubit/selection_cubit.dart';
import 'RentedProductCard.dart';

class RentedProductsHorizontal extends StatefulWidget {
  final List<CartItemEntity> products;

  /// still optional: تستقبل آخر نسخة من الـ Map عند أي تغيير إذا بتحب

  const RentedProductsHorizontal({super.key, required this.products});

  @override
  State<RentedProductsHorizontal> createState() =>
      _RentedProductsHorizontalState();
}

class _RentedProductsHorizontalState extends State<RentedProductsHorizontal> {
  // === Helpers ===
  DateTime _dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

  DateTime get _tomorrow {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    return today.add(const Duration(days: 1));
  }

  String _d(DateTime d) {
    final m = d.month.toString().padLeft(2, '0');
    final day = d.day.toString().padLeft(2, '0');
    return '${d.year}-$m-$day';
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  Future<void> _pickRange(CartItemEntity p) async {
    final cubit = context.read<RentalSelectionCubit>();
    final selections = cubit.state.selections;

    // حضّر حدود أولية منطقية:
    final tomorrow = _tomorrow;
    DateTime s0 = _dateOnly(selections[p.id]?.start ?? tomorrow);
    if (s0.isBefore(_dateOnly(tomorrow))) s0 = _dateOnly(tomorrow);

    DateTime e0 = _dateOnly(
      selections[p.id]?.end ?? s0.add(const Duration(days: 1)),
    );
    if (!e0.isAfter(s0)) e0 = s0.add(const Duration(days: 1));
    final maxEndFromS0 = s0.add(const Duration(days: 365));
    if (e0.isAfter(maxEndFromS0)) e0 = maxEndFromS0;

    final hadSelectionBefore = selections.containsKey(p.id);

    final range = await showDateRangePicker(
      context: context,
      firstDate: tomorrow,
      lastDate: tomorrow.add(const Duration(days: 365 * 3)),
      initialDateRange: DateTimeRange(start: s0, end: e0),
      helpText: 'Select rental period (${p.productEntity.nameEn})',
      cancelText: 'Clear', // زر إلغاء/مسح
      confirmText: 'Apply',
      builder: (ctx, child) {
        return Theme(
          data: Theme.of(ctx).copyWith(
            colorScheme: Theme.of(
              ctx,
            ).colorScheme.copyWith(primary: Theme.of(ctx).colorScheme.primary),
          ),
          child: child!,
        );
      },
      // إذا نسختك من Flutter تدعم 3 وسائط:
      selectableDayPredicate: (DateTime day, DateTime? start, DateTime? end) {
        final d = _dateOnly(day);
        final tmr = _tomorrow;
        if (d.isBefore(tmr)) return false;

        if (start == null && end == null) return true;

        if (start != null && end == null) {
          final s = _dateOnly(start);
          if (!d.isAfter(s)) return false; // end > start
          if (d.isAfter(s.add(const Duration(days: 365))))
            return false; // ≤ سنة
          return true;
        }

        if (start == null && end != null) {
          final e = _dateOnly(end);
          if (!d.isBefore(e)) return false; // start < end
          if (e.isAfter(d.add(const Duration(days: 365))))
            return false; // end ≤ start+سنة
          if (d.isBefore(tmr)) return false; // start ≥ بكرا
          return true;
        }
        return true;
      },
    );

    // Clear/Cancel
    if (range == null) {
      if (hadSelectionBefore) {
        cubit.clear(p.id);
      }
      return;
    }

    // توحيد إلى يوم فقط
    final startLocal = _dateOnly(range.start);
    final endLocal = _dateOnly(range.end);

    // تحققات نهائية
    if (startLocal.isBefore(_dateOnly(tomorrow))) {
      _showError('Start date must be from tomorrow or later.');
      return;
    }
    if (!endLocal.isAfter(startLocal)) {
      _showError('End date must be after the start date (at least 1 day).');
      return;
    }
    if (endLocal.isAfter(startLocal.add(const Duration(days: 365)))) {
      _showError('End date cannot be more than 1 year after the start date.');
      return;
    }

    // نجاح: خزّن عبر الكيوبت (UTC midnight ضمن RentalPeriod.fromLocalDays)
    cubit.setPeriodFromLocalDays(
      p.id,
      startLocal,
      endLocal,
      p.productEntity.rentalPrice,
    );
  }

  void _clear(CartItemEntity p) {
    final cubit = context.read<RentalSelectionCubit>();
    cubit.clear(p.id);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.products.isEmpty) {
      return const Center(child: Text('No rented products.'));
    }

    return SizedBox(
      height: 250,
      child: BlocBuilder<RentalSelectionCubit, RentalSelectionState>(
        builder: (context, state) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            itemCount: widget.products.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final item = widget.products[index];
              final sel = state.selections[item.id];

              return SizedBox(
                width: 280,
                child: RentedProductCard(
                  item: item,
                  selection: sel,
                  onPickRange: () => _pickRange(item),
                  onClear: sel == null ? null : () => _clear(item),
                  dateLabel:
                      sel == null
                          ? null
                          : 'من: ${_d(sel.start)}  إلى: ${_d(sel.end)}',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
