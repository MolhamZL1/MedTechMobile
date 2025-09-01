import 'package:medtech_mobile/features/order/domain/entities/order_entities.dart';

abstract class OrderState {
  const OrderState();
}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderLoaded extends OrderState {
  final List<OrderEntity> orders;  

  const OrderLoaded(this.orders);
}

class OrderError extends OrderState {
  final String message;

  const OrderError(this.message);
}
