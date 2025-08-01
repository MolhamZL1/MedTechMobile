import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/profile/editprofile/editprofileappbar.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/setting/notifications/constnotificationcard.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/setting/notifications/notificationswitchcard.dart';

class Notificationpage extends StatelessWidget {
  const Notificationpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'إعدادات الإشعارات',icon: Icons.notifications_outlined, color1: Colors.purple,),
      body: Container(
         color: Colors.grey.shade100,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              children: [
         Constnotificationcard(),
         Notificationswitchcard()
              ],
            ),
          ),
        ),
      ),
    );
  }
}