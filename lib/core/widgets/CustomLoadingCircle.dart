import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomLoadingCircle extends StatelessWidget {
  const CustomLoadingCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: AppColors.primary));
  }
}
