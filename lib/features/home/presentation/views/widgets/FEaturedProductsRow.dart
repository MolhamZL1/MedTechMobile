import 'package:flutter/material.dart';

import '../../../../products/domain/entities/product_entitie.dart';
import '../../../../products/presentation/views/widgets/product_card/product_card.dart';

class FEaturedProductsRow extends StatelessWidget {
  const FEaturedProductsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: featuredProducts.length,
        itemBuilder: (context, index) {
          final product = featuredProducts[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: AspectRatio(
              aspectRatio: 0.72,
              child: CustomProductCard(productEntitie: product),
            ),
          );
        },
      ),
    );
  }
}
