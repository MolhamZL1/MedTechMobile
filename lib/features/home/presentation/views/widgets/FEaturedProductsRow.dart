import 'package:flutter/material.dart';

import '../../../../products/domain/entities/product_entitie.dart';
import '../../../../products/presentation/views/widgets/product_card/product_card.dart';

class FEaturedProductsRow extends StatelessWidget {
  const FEaturedProductsRow({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: AspectRatio(
              aspectRatio: 0.72,
              child: CustomProductCard(productEntitie: products[index]),
            ),
          );
        },
      ),
    );
  }
}
