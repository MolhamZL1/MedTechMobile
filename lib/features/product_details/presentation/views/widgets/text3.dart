import 'package:flutter/material.dart';
import 'package:medtech_mobile/core/utils/app_colors.dart';

class Text3 extends StatelessWidget {
  const Text3({super.key});

  @override
  Widget build(BuildContext context) {
    return    Padding(
             padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 15),
             child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Choose Option ",
              
              style: TextStyle(color: AppColors.primary,
              fontSize: 20,
              fontWeight: FontWeight.bold
              ),)),
           );
  }
}