import 'package:flutter/material.dart';
import 'package:medtech_mobile/core/utils/app_colors.dart';
import 'package:medtech_mobile/features/profile/headerdesign/Text12.dart';
import 'package:medtech_mobile/features/profile/headerdesign/text1.dart';
import 'package:medtech_mobile/features/profile/headerdesign/text13.dart';
import 'package:medtech_mobile/features/profile/headerdesign/dcinfo.dart';
import 'package:medtech_mobile/features/profile/headerdesign/doctornamwtext.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/helpcolumn/helpcolumns.dart';
import 'package:medtech_mobile/features/profile/headerdesign/logoutbutton.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/profilecolumn/editprofilecard.dart';
import 'package:medtech_mobile/features/profile/headerdesign/email.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/profilecolumn/favoritecard.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/profilecolumn/paymentcard.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/profilecolumn/profilecardscolumns.dart';
import 'package:medtech_mobile/features/profile/headerdesign/profilepicture.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/profilecolumn/sitecard.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/settingcolumn/settingcardscolumns.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.grey.shade100,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Dcinfo(),
              Text11(),
              Profilecardscolumns(),
              Text12(),
              Settingcardscolumns(),
              Text13(),
              Helpcolumns(),
              SizedBox(height: 25),
              Logoutbutton(),
            ],
          ),
        ),
      ),
    );
  }
}
