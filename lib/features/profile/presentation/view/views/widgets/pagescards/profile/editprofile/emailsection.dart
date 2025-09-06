import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/profile/editprofile/customtextfield.dart';

class Emailsection extends StatelessWidget {
  final TextEditingController emailController;

  const Emailsection({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Column(
        children: [
          Customtextfield(
            text: "البريد الالكتروني ",
            icon: Icons.email,
            controller: emailController,
            title: "amdr@gmail.com",
          ),
        ],
      ),
    );
  }
}
