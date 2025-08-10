import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/utils/app_colors.dart';
import 'package:medtech_mobile/features/products/presentation/views/widgets/custtom_filter_icon.dart';

import '../../cubits/cubit/products_cubit.dart';
import 'ProductsGridView.dart';
import 'category_list.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "المنتجات",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CustomFilterIcon(),
                SizedBox(width: 15),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 50),
                      hintText: 'ابحث عن الاجهزة الطبية ... ',
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.qr_code_scanner_outlined,
                          color: AppColors.primary,
                        ),
                      ),
                      fillColor: AppColors.formcolor,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 35, child: CategoriesList()),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "${context.watch<ProductsCubit>().products.length} منتجات",
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state is ProductsSuccess) {
                  return ProductsGridView(products: state.products);
                } else if (state is ProductsError) {
                  return Center(child: Text(state.errorMessage));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
