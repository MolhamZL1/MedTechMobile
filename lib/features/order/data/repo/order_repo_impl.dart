import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medtech_mobile/core/errors/failures.dart';
import 'package:medtech_mobile/core/services/database_service.dart';
import 'package:medtech_mobile/core/utils/backend_endpoints.dart';
import 'package:medtech_mobile/features/order/data/model/order_model.dart';
import 'package:medtech_mobile/features/order/domain/entities/order_entities.dart';
import 'package:medtech_mobile/features/order/domain/repos/order_repo.dart';
import 'dart:developer';

class OrderRepoImpl implements OrderRepo {
  final DatabaseService databaseService;
  OrderRepoImpl({required this.databaseService});

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrders({
    required String id,
  }) async {
    try {
      var data = await databaseService.getData(
        endpoint: BackendEndpoints.getOrders,
        rowid: id,
      );
      List<OrderEntity> orders = List<OrderEntity>.from(
        data.map((e) => OrderModel.fromJson(e).toEntity()),
      );
      return right(orders);
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
