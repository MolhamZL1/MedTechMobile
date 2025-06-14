import 'package:flutter/material.dart'; // ✅ الصحيح

import 'package:medtech_mobile/core/utils/app_colors.dart';

abstract class AppTextStyles {
  static TextStyle? headline = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );

  static TextStyle body = TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
}
