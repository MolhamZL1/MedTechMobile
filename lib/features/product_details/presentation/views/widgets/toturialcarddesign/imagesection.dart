import 'package:flutter/material.dart';
import 'package:medtech_mobile/core/utils/app_images.dart';

class Imagesection extends StatelessWidget {
  const Imagesection({super.key});

  @override
  Widget build(BuildContext context) {
    return    ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          child: SizedBox(
            height: 100,
            child: Image.network(AppImages.imagesHome),
          ),
        );
  }
}