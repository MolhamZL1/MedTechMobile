import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medtech_mobile/core/utils/app_themes.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/profile/editprofile/editprofileappbar.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/setting/safety&privacy/biometriccheck.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/setting/safety&privacy/changepasswordcard.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/setting/safety&privacy/constcard.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/setting/safety&privacy/deleteaccountcard.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/setting/safety&privacy/safetytext1.dart';

class Safetypage extends StatelessWidget {
  const Safetypage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'الخصوصية والأمان',icon: Icons.shield_outlined, ),
      body: Container(
         color: Colors.grey.shade100,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              children: [
           Constcard(),
            Safetytext1(),
            Biometriccheck(),
            Changepasswordcard(),
            Deleteaccountcard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


