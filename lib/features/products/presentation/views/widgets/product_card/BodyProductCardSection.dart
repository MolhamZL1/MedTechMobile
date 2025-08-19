import 'package:flutter/material.dart';

import '../../../../domain/entities/product_entitie.dart';
import 'FooterProductCardSection.dart';
import 'RateProductCardSection.dart';

class BodyProductCardSection extends StatelessWidget {
  const BodyProductCardSection({super.key, required this.productEntitie});

  final ProductEntity productEntitie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productEntitie.categoryEn,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 4),
          Text(
            productEntitie.nameEn,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 4),
          RateProductCardSection(productEntitie: productEntitie),
          const SizedBox(height: 8),
          FooterProductCardSection(productEntitie: productEntitie),
        ],
      ),
    );
  }
}
