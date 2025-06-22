import 'package:flutter/material.dart';
import 'package:medtech_mobile/core/utils/app_colors.dart';

class Cutomcontainer extends StatelessWidget {
  String text;
   Cutomcontainer({super.key,
   required this.text});

  @override
  Widget build(BuildContext context) {
    return    Container(
      child: Center(
        child: Text(text)),
                height:40,width:100,
            decoration: BoxDecoration(
              
              color: AppColors.formcolor,
              borderRadius: BorderRadius.circular(35),
            ),
            );
            
  }
}