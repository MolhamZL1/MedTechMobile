import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/profile/editprofile/clickforedittext.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/profile/editprofile/customtextfield.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/profile/editprofile/editprofileappbar.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/profile/editprofile/emailsection.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/profile/editprofile/locationsection.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/profile/editprofile/namesection.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/profile/editprofile/numbersection.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/profile/editprofile/picturesection.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/profile/editprofile/savebutton.dart';
import 'package:medtech_mobile/features/profile/headerdesign/profilepicture.dart';

class Editprofile extends StatelessWidget { 
   Editprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: customAppBar(title: 'تعديل الملف الشخصي',
     icon: Icons.save, ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            color: Colors.grey.shade100,
          child: SingleChildScrollView(
            child: Column(
              children: [
                  Picturesection(),
              Namesection(),
               Emailsection(),
            Numbersection(),
            Locationsection(),
            SizedBox(height: 15,),
             Savebutton()
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}