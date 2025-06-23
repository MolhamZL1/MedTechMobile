import 'package:flutter/material.dart';
import 'package:medtech_mobile/core/widgets/CustomImageNetwork.dart';
import 'package:medtech_mobile/features/products/domain/entities/product_entitie.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.productEntitie});
  final ProductEntitie productEntitie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .4,
          child: Hero(
            tag: productEntitie.id,
            child: InteractiveViewer(
              maxScale: 5,
              minScale: 1,
              child: CustomImageNetwork(imageUrl: productEntitie.image),
            ),
          ),
        ),
      ],
    );
  }
}
