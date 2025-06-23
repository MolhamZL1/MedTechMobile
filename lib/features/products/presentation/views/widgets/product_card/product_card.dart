import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/products/domain/entities/product_entitie.dart';

import 'BodyProductCardSection.dart';
import 'HeaderCardProdcutSection.dart';

class CustomProductCard extends StatelessWidget {
  final ProductEntitie productEntitie;

  const CustomProductCard({super.key, required this.productEntitie});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderCardProdcutSection(productEntitie: productEntitie),
          BodyProductCardSection(productEntitie: productEntitie),
        ],
      ),
    );
  }
}
