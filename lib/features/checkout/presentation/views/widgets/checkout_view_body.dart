import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/functions/custom_validator.dart';
import 'package:medtech_mobile/features/cart/domain/entities/cart_item_entity.dart';
import 'package:medtech_mobile/features/checkout/presentation/cubits/cubit/checkout_cubit.dart';

import 'PaymentMethodsList.dart';
import 'RentedProductsHorizontal.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({
    super.key,
    required this.cartItems,
    required this.addressController,
    required this.formKey,
  });

  final List<CartItemEntity> cartItems;
  final TextEditingController addressController;
  final GlobalKey<FormState> formKey;

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        title(context, "Pay with"),
        PaymentMethodsList(),
        title(context, "My Address"),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Form(
            key: widget.formKey,
            child: TextFormField(
              controller: widget.addressController,
              validator: (value) {
                return CustomValidator.addressValidator(value);
              },
              decoration: InputDecoration(label: Text("Address")),
            ),
          ),
        ),
        title(context, "Rented Products"),
        RentedProductsHorizontal(
          products: widget.cartItems,
          onChanged: (selections) {},
        ),

        // title(context, "Instructions"),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        //   child: TextFormField(
        //     decoration: InputDecoration(label: Text("Phone Number")),
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        //   child: TextFormField(
        //     decoration: InputDecoration(label: Text("Notes")),
        //   ),
        // ),
      ],
    );
  }

  Align title(BuildContext context, String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(text, style: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }
}
