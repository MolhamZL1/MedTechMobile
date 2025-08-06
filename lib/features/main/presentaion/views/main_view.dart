import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/services/get_it_service.dart';
import 'package:medtech_mobile/features/cart/domain/repos/cart_repo.dart';
import 'package:medtech_mobile/features/cart/presentation/cubits/update_cart/update_cart_cubit.dart';
import 'package:medtech_mobile/features/main/presentaion/cubits/cubit/nav_bar_cubit.dart';
import 'package:medtech_mobile/features/main/presentaion/views/widgets/bottom_nav_bar/CustomNavigationBar.dart';

import 'widgets/MainViewBody.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const routeName = '/MainView';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => NavBarCubit())],
      child: Scaffold(
        bottomNavigationBar: CustomNavigationBar(),
        body: SafeArea(child: MainViewBody()),
      ),
    );
  }
}
