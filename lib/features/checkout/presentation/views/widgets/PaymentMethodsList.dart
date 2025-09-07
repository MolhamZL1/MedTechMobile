import 'package:flutter/material.dart';

import '../../../domain/entities/payment_method_entity.dart';
import 'PaymentMethodItem.dart';

class PaymentMethodsList extends StatefulWidget {
  const PaymentMethodsList({super.key});

  @override
  State<PaymentMethodsList> createState() => _PaymentMethodsListState();
}

class _PaymentMethodsListState extends State<PaymentMethodsList> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: paymentMethods.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () {
              if (paymentMethods[i].enabled) {
                selectedIndex = i;
                setState(() {});
              }
            },
            child: PaymentMethodItem(
              method: paymentMethods[i],
              selected: i == selectedIndex,
            ),
          );
        },
      ),
    );
  }
}
