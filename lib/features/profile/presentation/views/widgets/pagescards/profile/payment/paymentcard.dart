import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/profile/payment/paymentdaterow.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/profile/payment/paymentdetailesrow.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/profile/payment/paymenttyperow.dart';

class Paymentcarddetailes extends StatelessWidget {
  const Paymentcarddetailes({super.key});

  @override
  Widget build(BuildContext context) {
    return  Card(

        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
             mainAxisSize: MainAxisSize.min, 
            children: [
          Paymenttyperow(),
          Paymentdetailesrow(),
          Paymentdaterow(),
            ],
          ),
        ),
      );
  }
}