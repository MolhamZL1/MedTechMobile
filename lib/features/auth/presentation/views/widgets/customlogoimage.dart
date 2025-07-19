import 'package:flutter/material.dart';
import 'package:medtech_mobile/core/utils/app_images.dart';

class Customlogoimage extends StatelessWidget {
  const Customlogoimage({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 100,
      backgroundColor: Colors.transparent,
      child: Image.asset(AppImages.imagesMedtechlogo, fit: BoxFit.cover),
    );
  }
}
