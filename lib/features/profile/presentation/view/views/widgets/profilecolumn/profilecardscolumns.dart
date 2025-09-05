import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/profilecolumn/editprofilecard.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/profilecolumn/favoritecard.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/profilecolumn/paymentcard.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/profilecolumn/sitecard.dart';

class Profilecardscolumns extends StatelessWidget {
  const Profilecardscolumns({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
     Editprofilecard(),
     Sitecard(),
     Paymentcard(),
     Favoritecard(),
    ],);
  }
}