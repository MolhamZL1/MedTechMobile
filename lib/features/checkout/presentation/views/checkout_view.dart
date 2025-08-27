import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/checkout/presentation/views/widgets/checkout_view_body.dart';

import 'widgets/CheckoutBottomBar.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});
  static const String routeName = '/checkout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout'), centerTitle: true),
      bottomNavigationBar: const CheckoutBottomBar(), // ⬅️ Container + عمودي
      body: const CheckoutViewBody(),
    );
  }
}
