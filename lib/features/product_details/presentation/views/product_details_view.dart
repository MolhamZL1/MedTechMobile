import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/products/domain/entities/product_entitie.dart';

import 'widgets/ProductDetailsViewBody.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productEntitie});
  static const String routeName = 'ProductDetailsView';
  final ProductEntitie productEntitie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(productEntitie.category)),
      body: ProductDetailsViewBody(productEntitie: productEntitie),
    );
  }
}
