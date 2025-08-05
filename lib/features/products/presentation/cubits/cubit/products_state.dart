part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  final List<ProductEntity> products;
  ProductsSuccess(this.products);
}

final class ProductsError extends ProductsState {
  final String errorMessage;
  ProductsError(this.errorMessage);
}

final class ProductsLoading extends ProductsState {}
