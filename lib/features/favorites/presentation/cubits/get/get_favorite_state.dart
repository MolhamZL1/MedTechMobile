part of 'get_favorite_cubit.dart';

sealed class GetFavoriteState extends Equatable {
  const GetFavoriteState();

  @override
  List<Object> get props => [];
}

final class GetFavoriteInitial extends GetFavoriteState {}

final class GetFavoriteLoading extends GetFavoriteState {}

final class GetFavoriteSuccess extends GetFavoriteState {
  final List<ProductEntity> products;

  GetFavoriteSuccess({required this.products});
}

final class GetFavoriteFailure extends GetFavoriteState {
  final String errMessage;

  GetFavoriteFailure({required this.errMessage});
}
