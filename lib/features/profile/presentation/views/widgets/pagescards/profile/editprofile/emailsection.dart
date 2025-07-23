import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/profile/editprofile/customtextfield.dart';

class Emailsection extends StatelessWidget {
  TextEditingController emailcontroller =TextEditingController();
   Emailsection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Column(
        children: [
         
                 Customtextfield(text: "البريد الالكتروني ",
                  icon: Icons.email,controller: emailcontroller,
                   title: "amdr@gmail.com"),
        ],
      ),
    );
  }
}