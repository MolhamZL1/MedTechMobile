import 'package:flutter/material.dart';
import 'package:medtech_mobile/core/utils/app_colors.dart';

class Text1 extends StatelessWidget {
  const Text1({super.key});

  @override
  Widget build(BuildContext context) {
    return    Padding(
             padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
             child: Align(
              alignment: Alignment.centerLeft,
              child: Text("advanced imaging",style: TextStyle(color: AppColors.primary),)),
           );
  }
}