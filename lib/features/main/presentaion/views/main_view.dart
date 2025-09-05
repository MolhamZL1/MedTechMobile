import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/services/get_it_service.dart';
import 'package:medtech_mobile/features/ai%20chat/presentation/views/ai_chat_view.dart';
import 'package:medtech_mobile/features/favorites/domain/repo/favorite_repo.dart';
import 'package:medtech_mobile/features/favorites/presentation/cubits/cubit/addto_favorite_cubit.dart';
import 'package:medtech_mobile/features/main/presentaion/cubits/cubit/nav_bar_cubit.dart';
import 'package:medtech_mobile/features/main/presentaion/views/widgets/bottom_nav_bar/CustomNavigationBar.dart';

import 'widgets/AiFAB.dart';
import 'widgets/MainViewBody.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const routeName = '/MainView';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => NavBarCubit())],
      child: Scaffold(
        bottomNavigationBar: const CustomNavigationBar(),
        floatingActionButton: AiFAB(
          onPressed: () {
            Navigator.pushNamed(context, AiChatView.routeName);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: const SafeArea(child: MainViewBody()),
      ),
    );
  }
}
