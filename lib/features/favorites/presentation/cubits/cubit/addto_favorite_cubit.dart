import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medtech_mobile/features/favorites/domain/repo/favorite_repo.dart';

part 'addto_favorite_state.dart';

class AddtoFavoriteCubit extends Cubit<AddtoFavoriteState> {
  AddtoFavoriteCubit(this.favoriteRepo) : super(AddtoFavoriteInitial());
  final FavoriteRepo favoriteRepo;
  void addToFavorite({required String id}) async {
    emit(AddtoFavoriteLoading());
    var result = await favoriteRepo.addToFavorite(id: id);
    result.fold(
      (e) => emit(AddtoFavoriteError(errMessage: e.errMessage)),
      (r) => emit(AddtoFavoriteSuccess()),
    );
  }
}
