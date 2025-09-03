import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/widgets/CustomLoadingCircle.dart';
import 'package:medtech_mobile/features/cart/presentation/cubits/fetch_Cart/fetch_cart_cubit.dart';
import 'package:medtech_mobile/features/checkout/presentation/views/checkout_view.dart';

import 'CartItemWidget.dart';
import 'SummaryOrderWidget.dart';

class CartviewBody extends StatelessWidget {
  const CartviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          children: [
            ListTile(
              title: Text(
                "Cart",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              trailing: Text(
                "${context.watch<FetchCartCubit>().cartEntity?.cartItems.length ?? ".."} items",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Expanded(
              child: BlocBuilder<FetchCartCubit, FetchCartState>(
                builder: (context, state) {
                  if (state is FetchCartSuccess) {
                    final items = state.cartEntity.cartItems;
                    if (items.isEmpty) {
                      return const Center(child: Text('Your cart is empty'));
                    }

                    return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item =
                            items[index]; // خزن العنصر قبل أي تعديل على الليست

                        return Dismissible(
                          key: ValueKey(item.productEntity.id),
                          direction: DismissDirection.endToStart,

                          // لازم تكون موجودة بما إنك عرّفت secondaryBackground
                          background: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color:
                                  Colors
                                      .transparent, // ما بتبين لأن الاتجاه endToStart فقط
                              border: Border.all(color: Colors.transparent),
                            ),
                          ),

                          // هاي بتظهر لما تسحب من اليمين لليسار (end -> start)
                          secondaryBackground: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(.1),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.red.withOpacity(.3),
                              ),
                            ),
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text(
                                  'Delete',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(Icons.delete_outline, color: Colors.red),
                              ],
                            ),
                          ),

                          onDismissed: (direction) {
                            context.read<FetchCartCubit>().deleteCartItem(
                              item: item,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  'Removed ${item.productEntity.nameEn}',
                                ),
                              ),
                            );
                          },

                          child: CartItemWidget(cartItemEntity: item),
                        );
                      },
                    );
                  } else if (state is FetchCartError) {
                    return Center(child: Text(state.message));
                  } else {
                    return const CustomLoadingCircle();
                  }
                },
              ),
            ),

            SummaryOrderWidget(
              orderPrice:
                  context
                      .watch<FetchCartCubit>()
                      .cartEntity
                      ?.total
                      .toDouble() ??
                  0,
            ),
            SizedBox(height: 80),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Colors.grey.shade300)),
          ),
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, CheckoutView.routeName);
            },
            icon: Icon(Icons.check),
            label: Text("Checkout"),
          ),
        ),
      ],
    );
  }
}
