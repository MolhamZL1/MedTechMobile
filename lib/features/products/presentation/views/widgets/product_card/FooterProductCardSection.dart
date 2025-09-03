import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/features/cart/presentation/cubits/update_cart/update_cart_cubit.dart';

import '../../../../../cart/data/models/cart_item_model.dart';
import '../../../../domain/entities/product_entitie.dart';

class FooterProductCardSection extends StatelessWidget {
  const FooterProductCardSection({super.key, required this.productEntitie});

  final ProductEntity productEntitie;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              r"$ "
              '${productEntitie.salePrice}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 6),
            // Visibility(
            //   visible: productEntitie.oldPrice != null,
            //   child: Text(
            //     r"$ "
            //     '${productEntitie.oldPrice}',
            //     style: Theme.of(context).textTheme.bodySmall?.copyWith(
            //       decoration: TextDecoration.lineThrough,
            //     ),
            //   ),
            // ),
          ],
        ),
        BlocListener<UpdateCartCubit, UpdateCartState>(
          listener: (context, state) {
            if (state is UpdateCartSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('Product added to cart.'),
                ),
              );
            }
            if (state is UpdateCartError) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text('Failed to add product to cart.'),
                ),
              );
            }
          },
          child: IconButton(
            onPressed: () {
              context.read<UpdateCartCubit>().updateCart(
                id: productEntitie.id.toString(),
                qty: 1,
                transactionType: TransactionType.sale,
              );
            },
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
