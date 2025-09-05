import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/utils/app_colors.dart';
import 'package:medtech_mobile/features/cart/data/models/cart_item_model.dart';
import 'package:medtech_mobile/features/products/domain/entities/product_entitie.dart';

import '../../../cubits/cubit/transaction_type_cubit.dart';

class Pricecolumn extends StatelessWidget {
  const Pricecolumn({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    String transactionType =
        context.watch<TransactionTypeCubit>().getTransactionType();
    return Container(
      height: 50,

      child: Column(
        children: [
          Text(
            transactionType == TransactionType.rent
                ? "\$ ${productEntity.rentalPrice}"
                : "\$ ${productEntity.salePrice}",
            style: TextStyle(fontSize: 20, color: AppColors.primary),
          ),

          Text(
            transactionType == TransactionType.rent
                ? "Rental Price Per day"
                : "Purchase Price",
            style: TextStyle(
              fontSize: 10,
              color: Theme.of(context).textTheme.bodySmall?.color,
            ),
          ),
        ],
      ),
    );
  }
}
