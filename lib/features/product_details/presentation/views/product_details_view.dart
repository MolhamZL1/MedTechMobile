import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/widgets/favorite_button.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/addtocardsection/addtocard.dart';
import 'package:medtech_mobile/features/products/domain/entities/product_entitie.dart';

import '../../../../core/services/get_it_service.dart';
import '../../../cart/domain/repos/cart_repo.dart';
import '../../../cart/presentation/cubits/update_cart/update_cart_cubit.dart';
import 'widgets/ProductDetailsViewBody.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productEntitie});
  static const String routeName = 'ProductDetailsView';
  final ProductEntity productEntitie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productEntitie.categoryEn),
        actions: [
          FavoriteButton(),
          SizedBox(width: 8),
          IconButton(onPressed: () {}, icon: Icon(Icons.share_outlined)),
        ],
      ),
      body: ProductDetailsViewBody(productEntitie: productEntitie),
      bottomNavigationBar: BlocProvider(
        create: (context) => UpdateCartCubit(getIt.get<CartRepo>()),
        child: Addtocardsec(id: productEntitie.id.toString()),
      ),
    );
  }
}
