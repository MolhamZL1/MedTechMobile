import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/services/get_it_service.dart';
import 'package:medtech_mobile/features/favorites/domain/repo/favorite_repo.dart';

import '../../../profile/presentation/view/views/widgets/pagescards/profile/editprofile/editprofileappbar.dart';
import '../cubits/get/get_favorite_cubit.dart';
import 'widgets/FavoriteViewBody.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});
  static const routName = "/favoritesView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'المنتجات المفضلة', icon: Icons.favorite),
      body: BlocProvider(
        create:
            (context) =>
                GetFavoriteCubit(getIt.get<FavoriteRepo>())..getFavorites(),
        child: FavoriteViewBody(),
      ),
    );
  }
}
