import 'package:dartz/dartz.dart';
import 'package:medtech_mobile/core/errors/failures.dart';
import 'package:medtech_mobile/features/order/domain/entities/order_entities.dart';

abstract class OrderRepo {
  Future<Either<Failure, List<OrderEntity>>> getOrders({required String id});
}
