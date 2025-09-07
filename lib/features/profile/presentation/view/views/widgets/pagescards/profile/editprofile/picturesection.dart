import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/presentation/view/headerdesign/doctornamwtext.dart';
import 'package:medtech_mobile/features/profile/presentation/view/headerdesign/email.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/profile/editprofile/clickforedittext.dart';
import 'package:medtech_mobile/features/profile/presentation/view/headerdesign/profilepicture.dart';

class Picturesection extends StatelessWidget {
  const Picturesection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     color:Colors.white ,
      child:  Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
        children: [
           Profilepicture(
            icon: Icons.camera_alt,
           ),
          Clickforedittext(),
        ],
             ),
      ), 
    );
  }
}