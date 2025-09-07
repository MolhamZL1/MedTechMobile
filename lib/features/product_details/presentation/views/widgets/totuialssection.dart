import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/toturialcarddesign/tutorialcard.dart';
import 'package:medtech_mobile/features/products/domain/entities/vedio_entity.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../vedio/vedio_view.dart';

class Totuialssection extends StatelessWidget {
  const Totuialssection({super.key, required this.vedioEntitys});
  final List<VedioEntity> vedioEntitys;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: vedioEntitys.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              launchUrl(Uri.parse(vedioEntitys[index].url));
            },
            child: tutorialcard(vedioEntity: vedioEntitys[index]),
          );
        },
      ),
    );
  }
}
