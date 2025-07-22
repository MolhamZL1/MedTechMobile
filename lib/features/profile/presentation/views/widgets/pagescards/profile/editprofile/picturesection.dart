import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/Profilestate.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/doctornamwtext.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/email.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/profile/editprofile/clickforedittext.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/profilepicture.dart';

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
           Profilepicture(icon: Icons.camera_alt,
           ),
          Clickforedittext(),
        ],
             ),
      ), 
    );
  }
}