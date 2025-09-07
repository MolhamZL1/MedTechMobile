import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/profile/editprofile/customtextfield.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/profile/editprofile/picturesection.dart';

class Namesection extends StatelessWidget {
  final TextEditingController nameController;

  const Namesection({super.key, required this.nameController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Column(
        children: [
          Customtextfield(
            text: "الاسم الكامل ",
            icon: Icons.person,
            controller: nameController,
            title: "د.احمد ",
          ),
        ],
      ),
    );
  }
}
