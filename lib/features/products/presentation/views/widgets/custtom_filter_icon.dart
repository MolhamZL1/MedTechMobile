import 'package:flutter/material.dart';
import 'package:medtech_mobile/core/utils/app_colors.dart';

class CustomFilterIcon extends StatelessWidget {
  const CustomFilterIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(.13),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(Icons.filter_alt_outlined, color: AppColors.primary),
      ),
    );
  }
}
