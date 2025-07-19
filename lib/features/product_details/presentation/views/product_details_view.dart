import 'package:flutter/material.dart';
import 'package:medtech_mobile/core/widgets/favorite_button.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/addtocardsection/addtocard.dart';
import 'package:medtech_mobile/features/products/domain/entities/product_entitie.dart';

import 'widgets/ProductDetailsViewBody.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productEntitie});
  static const String routeName = 'ProductDetailsView';
  final ProductEntitie productEntitie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productEntitie.category),
        actions: [
          FavoriteButton(),
          SizedBox(width: 8),
          IconButton(onPressed: () {}, icon: Icon(Icons.share_outlined)),
        ],
      ),
      body: ProductDetailsViewBody(productEntitie: productEntitie),
      bottomNavigationBar : Addtocardsec(),
    );
  }
}
