import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/features/checkout/presentation/cubits/cubit/checkout_cubit.dart';
import 'package:medtech_mobile/features/checkout/presentation/cubits/cubit/selection_cubit.dart';

class CheckoutBottomBar extends StatefulWidget {
  const CheckoutBottomBar({
    super.key,
    required this.formKey,
    required this.addressController,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController addressController;

  @override
  State<CheckoutBottomBar> createState() => _CheckoutBottomBarState();
}

class _CheckoutBottomBarState extends State<CheckoutBottomBar> {
  // قيم وهمية
  final int _itemsCount = 3;
  final double _subtotal = 1250.0;
  final double _shipping = 20.0;

  String _money(num n) {
    final s = n.toStringAsFixed(2);
    return '\$${s.replaceFirst(RegExp(r'\.00$'), '')}';
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final total = _subtotal + _shipping;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      decoration: BoxDecoration(
        color: t.scaffoldBackgroundColor,
        border: Border(top: BorderSide(color: t.dividerColor)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ملخص مرتب فوق
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: t.cardColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: t.dividerColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _LineRow(label: 'Items', value: '$_itemsCount'),
                  const SizedBox(height: 6),
                  _LineRow(label: 'Subtotal', value: _money(_subtotal)),
                  const SizedBox(height: 6),
                  _LineRow(label: 'Shipping', value: _money(_shipping)),
                  const Divider(height: 16),
                  _LineRow(
                    label: 'Total',
                    value: _money(total),
                    isEmphasis: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () {
                  if (widget.formKey.currentState!.validate()) {
                    final state = context.read<RentalSelectionCubit>().state;

                    final items = state.toRentedItemsList();

                    context.read<CheckoutCubit>().checkout(
                      address: widget.addressController.text,
                      rentedItems: items,
                    );
                  }
                },
                icon: const Icon(Icons.check),
                label: Text('Place Order'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LineRow extends StatelessWidget {
  const _LineRow({
    required this.label,
    required this.value,
    this.isEmphasis = false,
  });

  final String label;
  final String value;
  final bool isEmphasis;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return Row(
      children: [
        Text(
          label,
          style: isEmphasis ? t.textTheme.titleMedium : t.textTheme.bodyMedium,
        ),
        const Spacer(),
        Text(
          value,
          style:
              isEmphasis
                  ? t.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  )
                  : t.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
