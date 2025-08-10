import 'package:dartz/dartz.dart';
import 'package:medtech_mobile/core/errors/failures.dart';
import 'package:medtech_mobile/features/cart/domain/entities/cart_item_entity.dart';

abstract class CartRepo {
  Future<Either<Failure, void>> updateCartItem({
    required String id,
    required int qty,
  });
  Future<Either<Failure, List<CartItemEntity>>> getCartItems();
}
