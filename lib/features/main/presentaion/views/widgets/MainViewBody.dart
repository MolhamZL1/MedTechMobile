import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/cart/presentation/views/cart_view.dart';
import 'package:medtech_mobile/features/favorites/presentation/views/favorite_view.dart';
import 'package:medtech_mobile/features/home/presentation/views/home_view.dart';
import 'package:medtech_mobile/features/products/presentation/views/products_view.dart';
import 'package:medtech_mobile/features/profile/presentation/views/profile_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key, required this.selectedIndex});
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    List pages = [
      HomeView(),
      ProductsView(),
      CartView(),
      FavoriteView(),
      ProfileView(),
    ];
    return pages[selectedIndex];
  }
}
