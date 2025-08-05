part of 'fetch_cart_cubit.dart';

@immutable
sealed class FetchCartState {}

final class FetchCartInitial extends FetchCartState {}

final class FetchCartSuccess extends FetchCartState {
  final List<CartItemEntity> cartEntity;
  FetchCartSuccess(this.cartEntity);
}

final class FetchCartError extends FetchCartState {
  final String message;
  FetchCartError(this.message);
}

final class FetchCartLoading extends FetchCartState {}
