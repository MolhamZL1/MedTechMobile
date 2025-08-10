import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/toturialcarddesign/imagesection.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/toturialcarddesign/timesection.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/toturialcarddesign/toturialtitle.dart';
import 'package:medtech_mobile/features/products/domain/entities/vedio_entity.dart';

class tutorialcard extends StatelessWidget {
  const tutorialcard({super.key, required this.vedioEntity});
  final VedioEntity vedioEntity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Imagesection(),
              Toturialtitle(title: vedioEntity.name),
              Timesection(),
            ],
          ),
        ),
      ),
    );
  }
}
