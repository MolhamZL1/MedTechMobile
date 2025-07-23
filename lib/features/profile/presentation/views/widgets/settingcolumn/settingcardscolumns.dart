import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/settingcolumn/notificationcard.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/settingcolumn/safetycard.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/settingcolumn/settingcard.dart';

class Settingcardscolumns extends StatelessWidget {
  const Settingcardscolumns({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Notificationcard(),
         Safetycard(),
          Settingcard(),
               ],);
  }
}