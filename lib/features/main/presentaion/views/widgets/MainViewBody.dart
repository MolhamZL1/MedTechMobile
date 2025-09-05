import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/features/cart/presentation/views/cart_view.dart';
import 'package:medtech_mobile/features/favorites/presentation/views/favorite_view.dart';
import 'package:medtech_mobile/features/home/presentation/views/home_view.dart';
import 'package:medtech_mobile/features/order/presentation/views/order_view.dart';
import 'package:medtech_mobile/features/products/presentation/views/products_view.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/profile_view.dart';

import '../../cubits/cubit/nav_bar_cubit.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    List pages = [
      HomeView(),
      ProductsView(),
      CartView(),
      OrderView(),
      ProfileView(),
    ];
    return pages[context.watch<NavBarCubit>().currentIndex];
  }
}
