import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medtech_mobile/core/errors/failures.dart';
import 'package:medtech_mobile/core/services/database_service.dart';
import 'package:medtech_mobile/features/cart/data/models/cart_model.dart';
import 'package:medtech_mobile/features/cart/domain/entities/cart_entity.dart';
import 'package:medtech_mobile/features/cart/domain/repos/cart_repo.dart';

import '../../../../core/utils/backend_endpoints.dart';

class CartRepoImp extends CartRepo {
  final DatabaseService databaseService;

  CartRepoImp({required this.databaseService});
  @override
  Future<Either<Failure, CartEntity>> getCartItems() async {
    try {
      final data = await databaseService.getData(
        endpoint: BackendEndpoints.getCartItems,
      );
      CartEntity cartEntity = CartModel.fromJson(data).toEntity();
      return right(cartEntity);
    } catch (e) {
      log(e.toString());
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
    required String transactionType,
  }) async {
    try {
      await databaseService.addData(
        endpoint: BackendEndpoints.updateCartItem,
        data: {
          "productId": id,
          "quantity": qty,
          "transactionType": transactionType,
        },
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
