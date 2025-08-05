import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/profile/editprofile/editprofileappbar.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/setting/settings/darkthemecard.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/setting/settings/languagecard.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/setting/settings/settingtext.dart';

class Mainsettingpage extends StatelessWidget {
  const Mainsettingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'الإعدادات العامة',icon: Icons.settings, color1: Colors.grey,),
      body: Container(
         color: Colors.grey.shade100,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              children: [
      Settingtext(),
      Languagecard(),
      Darkthemecard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}