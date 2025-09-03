import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/profile/editprofile/editprofileappbar.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/profile/sitepage/cityrow.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/profile/sitepage/row1.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/profile/sitepage/sitecard.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/profile/sitepage/steetrow.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/profilecolumn/sitecard.dart';

class Sitepage extends StatelessWidget {
  const Sitepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'العناوين والمواقع',
     icon: Icons.add, ),
      body: Sitecard1(),
    );
  }
}