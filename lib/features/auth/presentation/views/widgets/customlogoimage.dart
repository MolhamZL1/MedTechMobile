import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:medtech_mobile/core/utils/app_images.dart';

class Customlogoimage extends StatelessWidget {
  const Customlogoimage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        AppImages.imagesMedtechlogo,
        width: 200,
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }
}
