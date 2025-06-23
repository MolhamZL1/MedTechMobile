import 'package:flutter/material.dart';

import '../../../../../../core/widgets/CustomImageNetwork.dart';
import '../../../../../../core/widgets/favorite_button.dart';
import '../../../../domain/entities/product_entitie.dart';

class HeaderCardProdcutSection extends StatelessWidget {
  const HeaderCardProdcutSection({super.key, required this.productEntitie});

  final ProductEntitie productEntitie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          child: CustomImageNetwork(imageUrl: productEntitie.image),
        ),

        Visibility(
          visible: productEntitie.oldPrice != null,
          child: Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text('عرض', style: const TextStyle(color: Colors.white)),
            ),
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(6),
            child: FavoriteButton(),
          ),
        ),
      ],
    );
  }
}
