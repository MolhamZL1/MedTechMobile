import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/profile/editprofile/customtextfield.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/profile/editprofile/picturesection.dart';

class Namesection extends StatelessWidget {
   TextEditingController namecontroller =TextEditingController();
   Namesection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Column(
        children: [
        
                 Customtextfield(text: "الاسم الكامل ",
                  icon: Icons.person,controller: namecontroller,
                   title: "د.احمد "),
        ],
      ),
    );
  }
}