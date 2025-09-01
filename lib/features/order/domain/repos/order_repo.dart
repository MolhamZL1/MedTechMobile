import 'package:medtech_mobile/features/order/domain/entities/order_entities.dart';

abstract class OrderRepo {
  Future<List<OrderEntity>> getOrders();
}
