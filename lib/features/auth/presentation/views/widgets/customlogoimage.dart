import 'package:flutter/material.dart';
import 'package:medtech_mobile/core/utils/app_images.dart';

class Customlogoimage extends StatelessWidget {
  const Customlogoimage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(55.0),
      child: Image.asset(AppImages.iconAppLogo, height: 200.0, width: 100.0),
    );
  }
}
