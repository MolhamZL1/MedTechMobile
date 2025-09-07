part of 'addto_favorite_cubit.dart';

sealed class AddtoFavoriteState extends Equatable {
  const AddtoFavoriteState();

  @override
  List<Object> get props => [];
}

final class AddtoFavoriteInitial extends AddtoFavoriteState {}

final class AddtoFavoriteLoading extends AddtoFavoriteState {}

final class AddtoFavoriteSuccess extends AddtoFavoriteState {}

final class AddtoFavoriteError extends AddtoFavoriteState {
  final String errMessage;
  const AddtoFavoriteError({required this.errMessage});
}
