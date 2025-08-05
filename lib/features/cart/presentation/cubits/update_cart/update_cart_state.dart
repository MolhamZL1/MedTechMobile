part of 'update_cart_cubit.dart';

@immutable
sealed class UpdateCartState {}

final class UpdateCartInitial extends UpdateCartState {}

final class UpdateCartLoading extends UpdateCartState {}

final class UpdateCartSuccess extends UpdateCartState {}

final class UpdateCartError extends UpdateCartState {
  final String message;
  UpdateCartError(this.message);
}
