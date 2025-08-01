import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/help/roles/mainrolescard.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/help/roles/rolescards.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/help/roles/rolescontainer.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/profile/editprofile/editprofileappbar.dart';

class Rolespage extends StatelessWidget {
  const Rolespage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: customAppBar(title: 'الشروط والأحكام',icon: Icons.policy_outlined, color1: Colors.blue,),
       body: Padding(
         padding: EdgeInsets.all(9),
         child: Column(
           children: [
         Mainrolescard(),
         SizedBox(height: 3,),
         Rolescards(text1: ' مقدمة 1.',
          text2: 'مرحباً بك في منصة MediCare لبيع وتأجير وصيانة الأجهزة الطبية. باستخدامك لهذا التطبيق، فإنك توافق على الالتزام بهذه الشروط والأحكام.',),
        Rolescontainer(),
           ],
         ),
       )
    );
  }
}