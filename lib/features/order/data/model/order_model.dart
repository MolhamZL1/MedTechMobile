import 'package:medtech_mobile/features/order/domain/entities/order_entities.dart';



class OrderModel extends OrderEntity {
  OrderModel({
    required super.id,
    required super.title,
    required super.date,
    required super.status,
    required super.price,
    required super.quantity,
    required super.imageUrl,
    super.tracking,
    super.deliveryDate,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      title: json['title'],
      date: DateTime.parse(json['date']),
      status: OrderStatus.values.firstWhere(
        (s) => s.toString().split('.').last == json['status'],
        orElse: () => OrderStatus.processing,
      ),
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'],
      imageUrl: json['imageUrl'],
      tracking: json['tracking'],
      deliveryDate: json['deliveryDate'] != null
          ? DateTime.parse(json['deliveryDate'])
          : null,
    );
  }
}
