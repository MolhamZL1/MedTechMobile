import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/services/get_it_service.dart';
import 'package:medtech_mobile/features/main/domain/repo/main_view_repo.dart';
import 'package:medtech_mobile/features/main/presentaion/cubits/cubit/fetch_main_view_cubit.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              FetchMainViewCubit(getIt.get<MainViewRepo>())..getMainView(),
      child: const HomeViewBody(),
    );
  }
}
