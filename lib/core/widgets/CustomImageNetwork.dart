import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:medtech_mobile/core/widgets/CustomLoadingCircle.dart';

import '../utils/app_colors.dart';

class CustomImageNetwork extends StatelessWidget {
  const CustomImageNetwork({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: double.infinity,
      fit: BoxFit.cover,
      placeholder: (context, url) => Center(child: CustomLoadingCircle()),
      errorWidget:
          (context, url, error) => Icon(Icons.error, color: AppColors.error),
    );
  }
}
