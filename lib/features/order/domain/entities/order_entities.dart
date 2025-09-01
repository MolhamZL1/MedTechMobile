enum OrderStatus { processing, shipped, completed, canceled }

class OrderEntity {
  final int id;
  final String title;
  final DateTime date;
  final OrderStatus status;
  final double price;
  final int quantity;
  final String imageUrl;
  final String? tracking;
  final DateTime? deliveryDate;

  OrderEntity({
    required this.id,
    required this.title,
    required this.date,
    required this.status,
    required this.price,
    required this.quantity,
    required this.imageUrl,
    this.tracking,
    this.deliveryDate,
  });
}
  