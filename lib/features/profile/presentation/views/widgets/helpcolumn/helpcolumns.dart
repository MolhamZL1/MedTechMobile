import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/helpcolumn/helpcard.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/helpcolumn/ratecard.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/helpcolumn/rolescard.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/profilecolumn/editprofilecard.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/profilecolumn/favoritecard.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/profilecolumn/paymentcard.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/profilecolumn/sitecard.dart';

class Helpcolumns extends StatelessWidget {
  const Helpcolumns({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    Ratecard(),
    Rolescard(),
    Helpcard()
    ],);
  }
}