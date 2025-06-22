import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medtech_mobile/core/utils/app_colors.dart';


class Customicon extends StatelessWidget {
  const Customicon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:20),
      child: Container(
        height:45,
        width: 45, 
       decoration: BoxDecoration(
    color: AppColors.formcolor,
     borderRadius: BorderRadius.circular(10),
      
  ),
        child: IconButton( onPressed: () {},
            
        icon: Icon(FontAwesomeIcons.filter,color:AppColors.primary,),
        
        ),
      ),
    );
  }
}