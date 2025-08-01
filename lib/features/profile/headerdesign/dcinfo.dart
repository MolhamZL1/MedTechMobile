import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/headerdesign/profilestate.dart';
import 'package:medtech_mobile/features/profile/headerdesign/doctornamwtext.dart';
import 'package:medtech_mobile/features/profile/headerdesign/email.dart';
import 'package:medtech_mobile/features/profile/headerdesign/profilepicture.dart';

class Dcinfo extends StatelessWidget {
  const Dcinfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     color:Colors.white ,
      child:  Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
        children: [
          Profilepicture(icon: Icons.message,
        
          ),
         Doctornamwtext(),
          Email(),
          profileStats(),
        ],
             ),
      ), 
    );
  }
}