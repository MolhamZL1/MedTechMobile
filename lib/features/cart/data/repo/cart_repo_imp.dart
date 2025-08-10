import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medtech_mobile/core/errors/failures.dart';
import 'package:medtech_mobile/core/services/database_service.dart';
import 'package:medtech_mobile/features/cart/domain/entities/cart_item_entity.dart';
import 'package:medtech_mobile/features/cart/domain/repos/cart_repo.dart';

import '../../../../core/utils/backend_endpoints.dart';
import '../models/cart_item_model.dart';

class CartRepoImp extends CartRepo {
  final DatabaseService databaseService;

  CartRepoImp({required this.databaseService});
  @override
  Future<Either<Failure, List<CartItemEntity>>> getCartItems() async {
    try {
      var data = await databaseService.getData(
        endpoint: BackendEndpoints.getCartItems,
      );
      List<CartItemEntity> cartItems =
          data.map((e) => CartItemModel.fromJson(e).toEntity()).toList();
      return right(cartItems);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateCartItem({
    required String id,
    required int qty,
  }) async {
    try {
      var data = await databaseService.addData(
        endpoint: BackendEndpoints.updateCartItem,
        data: {"productId": id, "quantity": qty},
      );

      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
