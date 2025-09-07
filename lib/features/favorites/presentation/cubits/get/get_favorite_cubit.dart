import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:medtech_mobile/features/favorites/domain/repo/favorite_repo.dart';
import 'package:medtech_mobile/features/products/domain/entities/product_entitie.dart';

part 'get_favorite_state.dart';

class GetFavoriteCubit extends Cubit<GetFavoriteState> {
  GetFavoriteCubit(this.favoriteRepo) : super(GetFavoriteInitial());
  final FavoriteRepo favoriteRepo;
  getFavorites() async {
    emit(GetFavoriteLoading());
    var result = await favoriteRepo.getFavorites();
    result.fold(
      (l) => emit(GetFavoriteFailure(errMessage: l.errMessage)),
      (r) => emit(GetFavoriteSuccess(products: r)),
    );
  }
}
