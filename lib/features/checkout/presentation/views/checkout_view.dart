import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/features/cart/domain/entities/cart_entity.dart';
import 'package:medtech_mobile/features/cart/presentation/cubits/fetch_Cart/fetch_cart_cubit.dart';
import 'package:medtech_mobile/features/checkout/domain/repos/checkout_repo.dart';
import 'package:medtech_mobile/features/checkout/presentation/cubits/cubit/checkout_cubit.dart';
import 'package:medtech_mobile/features/checkout/presentation/cubits/cubit/selection_cubit.dart';
import 'package:medtech_mobile/features/checkout/presentation/views/widgets/checkout_view_body.dart';

import '../../../../core/services/get_it_service.dart';
import '../../../cart/domain/entities/cart_item_entity.dart';
import '../../../cart/domain/repos/cart_repo.dart';
import 'widgets/CheckoutBottomBar.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartItems});
  static const String routeName = '/checkout';
  final List<CartItemEntity> cartItems;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CheckoutCubit(getIt.get<CheckoutRepo>()),
        ),
        BlocProvider(create: (context) => RentalSelectionCubit()),
      ],
      child: Scaffold(
        appBar: AppBar(title: const Text('Checkout'), centerTitle: true),
        bottomNavigationBar: CheckoutBottomBar(
          addressController: addressController,
          formKey: formKey,
        ),
        body: CheckoutViewBody(
          cartItems: widget.cartItems,
          addressController: addressController,
          formKey: formKey,
        ),
      ),
    );
  }
}
