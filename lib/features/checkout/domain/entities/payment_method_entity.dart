import 'package:flutter/material.dart';

/// نموذج بسيط لطريقة الدفع
class PaymentMethodEntity {
  final String id;
  final String title;
  final Widget logo;
  final bool enabled;

  const PaymentMethodEntity({
    required this.id,
    required this.title,
    required this.logo,
    this.enabled = true,
  });
}

final paymentMethods = const [
  PaymentMethodEntity(id: 'cash', title: 'Cash', logo: Icon(Icons.payments)),
  PaymentMethodEntity(id: 'card', title: 'Card', logo: Icon(Icons.credit_card)),
  PaymentMethodEntity(
    id: 'shamCash',
    title: 'Sham Cash',
    logo: Icon(Icons.wallet),
    enabled: false,
  ),
];
