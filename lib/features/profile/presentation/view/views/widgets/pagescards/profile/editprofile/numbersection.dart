import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/profile/editprofile/customtextfield.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/profile/editprofile/picturesection.dart';

class Numbersection extends StatelessWidget {
  final TextEditingController numberController;

  const Numbersection({super.key, required this.numberController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Column(
        children: [
          Customtextfield(
            text: "رقم الهاتف ",
            icon: Icons.phone,
            controller: numberController,
            title: "+966501234567 ",
          ),
        ],
      ),
    );
  }
}
