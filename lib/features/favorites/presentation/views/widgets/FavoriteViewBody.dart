import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:medtech_mobile/features/favorites/presentation/cubits/get/get_favorite_cubit.dart';

import '../../../../products/presentation/cubits/cubit/products_cubit.dart';
import '../../../../products/presentation/views/widgets/ProductsGridView.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavoriteCubit, GetFavoriteState>(
      builder: (context, state) {
        if (state is GetFavoriteSuccess) {
          return ProductsGridView(products: state.products);
        } else if (state is GetFavoriteFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
