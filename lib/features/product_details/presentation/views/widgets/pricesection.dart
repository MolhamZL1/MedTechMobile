import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/utils/app_colors.dart';
import 'package:medtech_mobile/features/products/domain/entities/prodetailes_entites.dart';
import 'package:medtech_mobile/features/products/domain/entities/product_entitie.dart';

import '../../../../cart/data/models/cart_item_model.dart';
import '../../cubits/cubit/transaction_type_cubit.dart';

class Pricesection extends StatelessWidget {
  const Pricesection({super.key, required this.productEntity});

  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    String transactionType = context.watch<TransactionTypeCubit>().state;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            transactionType == TransactionType.rent
                ? '\$${productEntity.rentalPrice}'
                : '\$${productEntity.salePrice}',
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          SizedBox(width: 15),
          Text(
            transactionType == TransactionType.rent
                ? '\$${productEntity.rentalPrice}'
                : '\$${productEntity.salePrice}',

            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              decoration: TextDecoration.lineThrough,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
