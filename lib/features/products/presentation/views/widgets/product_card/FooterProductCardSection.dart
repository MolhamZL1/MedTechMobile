import 'package:flutter/material.dart';

import '../../../../domain/entities/product_entitie.dart';

class FooterProductCardSection extends StatelessWidget {
  const FooterProductCardSection({super.key, required this.productEntitie});

  final ProductEntity productEntitie;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              r"$ "
              '${productEntitie.salePrice}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 6),
            // Visibility(
            //   visible: productEntitie.oldPrice != null,
            //   child: Text(
            //     r"$ "
            //     '${productEntitie.oldPrice}',
            //     style: Theme.of(context).textTheme.bodySmall?.copyWith(
            //       decoration: TextDecoration.lineThrough,
            //     ),
            //   ),
            // ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.shopping_cart_outlined, color: Colors.blue),
        ),
      ],
    );
  }
}
