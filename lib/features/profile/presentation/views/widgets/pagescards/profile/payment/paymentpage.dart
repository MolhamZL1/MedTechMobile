import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/profile/editprofile/editprofileappbar.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/profile/payment/paymentcard.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/profilecolumn/paymentcard.dart';

class Paymentpage extends StatelessWidget {
  const Paymentpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'طرق الدفع',
      icon: Icons.add, color1: Colors.orange,),
      body: Paymentcarddetailes(),
    );
  }
}