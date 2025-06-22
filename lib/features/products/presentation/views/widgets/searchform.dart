import 'package:flutter/material.dart';
import 'package:medtech_mobile/core/utils/app_colors.dart';

class Searchform extends StatelessWidget {
  @required
  String labelText;
  @required
  Widget? preIcon;
  TextEditingController mycontroller;

  Searchform({
    super.key,
    required this.labelText,
    required this.mycontroller,
    required this. preIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 35),
  
        child: TextFormField(
          
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 50),
            labelText: labelText, 
           prefixIcon: preIcon,
           fillColor:AppColors.formcolor
          ),
        ),
      
    );
  }
}
