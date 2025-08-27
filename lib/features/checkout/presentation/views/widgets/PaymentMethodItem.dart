import 'package:flutter/material.dart';

import '../../../domain/entities/payment_method_entity.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    required this.method,
    required this.selected,
  });

  final PaymentMethodEntity method;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final bgColor = selected ? t.primaryColor.withOpacity(.08) : t.cardColor;
    final borderColor = selected ? t.primaryColor : t.dividerColor;
    final shadow =
        selected
            ? [
              BoxShadow(
                color: t.primaryColor.withOpacity(.12),
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ]
            : [
              BoxShadow(
                color: Colors.black.withOpacity(.03),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ];

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 180),
      opacity: method.enabled ? 1 : .45,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        width: 120,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor, width: 1.5),
          boxShadow: shadow,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: t.primaryColor,
              child: ColoredBox(color: t.primaryColor, child: method.logo),
            ),
            const SizedBox(height: 8),
            Text(
              method.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: t.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
