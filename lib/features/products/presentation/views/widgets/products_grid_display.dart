import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/features/products/presentation/cubits/cubit/products_cubit.dart';
import 'ProductsGridView.dart';
import 'category_list.dart';

class ProductsGridDisplay extends StatelessWidget {
  const ProductsGridDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: const ValueKey('products'),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 35, child: CategoriesList()),
          const SizedBox(height: 15),
          Text(
            "${context.watch<ProductsCubit>().products.length} منتجات",
          ),
          const SizedBox(height: 10),
          Expanded(
            child: BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state is ProductsSuccess) {
                  return ProductsGridView(products: state.products);
                } else if (state is ProductsError) {
                  return Center(child: Text(state.errorMessage));
                } else {
                  final products = context.read<ProductsCubit>().products;
                  return products.isNotEmpty
                      ? ProductsGridView(products: products)
                      : const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
