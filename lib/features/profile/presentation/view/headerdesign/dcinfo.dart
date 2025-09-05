import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/domain/entites/profile_entity.dart';
import 'package:medtech_mobile/features/profile/presentation/view/headerdesign/profilestate.dart';
import 'package:medtech_mobile/features/profile/presentation/view/headerdesign/doctornamwtext.dart';
import 'package:medtech_mobile/features/profile/presentation/view/headerdesign/email.dart';
import 'package:medtech_mobile/features/profile/presentation/view/headerdesign/profilepicture.dart';

class Dcinfo extends StatelessWidget {
    final ProfileEntity profile;
  const Dcinfo({super.key,required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
     color:Colors.white ,
      child:  Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
        children: [
          Profilepicture(icon: Icons.message,
        imageUrl: profile.image,
          ),
         Doctornamwtext(name: profile.username),
          Email(email: profile.email),
          profileStats(),
        ],
             ),
      ), 
    );
  }
}