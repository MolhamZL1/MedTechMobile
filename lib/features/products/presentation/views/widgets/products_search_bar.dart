import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/utils/app_colors.dart';
import 'package:medtech_mobile/features/products/presentation/cubits/cubit/products_cubit.dart';
import 'custtom_filter_icon.dart';

class ProductsSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onSearchTapped;

  const ProductsSearchBar({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onSearchTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const CustomFilterIcon(),
          const SizedBox(width: 15),
          Expanded(
            child: TextFormField(
              controller: controller,
              focusNode: focusNode,
              onTap: onSearchTapped,
              onFieldSubmitted: (value) {
                if (value.isNotEmpty) {
                  context.read<ProductsCubit>().searchProducts(value);
                  context.read<ProductsCubit>().saveSearchQuery(value);
                }
                focusNode.unfocus();
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 50),
                hintText: 'ابحث عن الاجهزة الطبية ... ',
                prefixIcon: IconButton(
                  onPressed: () => focusNode.unfocus(),
                  icon: Icon(Icons.search, color: AppColors.primary),
                ),
                fillColor: AppColors.formcolor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
