enum OrderStatus { processing, shipped, completed, canceled }

class OrderModel {
  final String id;
  final DateTime date;
  final String title;
  final int quantity;
  final OrderStatus status;
  final String? tracking;
  final DateTime? deliveryDate;
  final double price;
  final String imageUrl;

  OrderModel({
    required this.id,
    required this.date,
    required this.title,
    required this.quantity,
    required this.status,
    required this.tracking,
    required this.deliveryDate,
    required this.price,
    required this.imageUrl,
  });
}