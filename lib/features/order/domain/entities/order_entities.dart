import '../../data/model/order_model.dart';

class OrderEntity {
  final int id;
  final int userId;
  final OrderStatus status;
  final num totalAmount;
  final String shippingAddress;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<OrderItemEntity> items;

  OrderEntity({
    required this.id,
    required this.userId,
    required this.status,
    required this.totalAmount,
    required this.shippingAddress,
    required this.createdAt,
    required this.updatedAt,
    required this.items,
  });
}

class OrderItemEntity {
  final int id;
  final int orderId;
  final int productId;
  final int quantity;
  final String transactionType;
  final num priceAtTimeOfTransaction;
  final num? costAtTimeOfTransaction;

  // امتداد عقد الإيجار
  final int? extendedContractId;
  final DateTime? newEndDateForExtension;

  // تواريخ الإيجار (قد تكون null في البيع)
  final DateTime? rentalStartDate;
  final DateTime? rentalEndDate;
  final DateTime? returnDate;

  final String productName;
  final String productImage;

  OrderItemEntity({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.quantity,
    required this.transactionType,
    required this.priceAtTimeOfTransaction,
    required this.costAtTimeOfTransaction,
    required this.extendedContractId,
    required this.newEndDateForExtension,
    required this.rentalStartDate,
    required this.rentalEndDate,
    required this.returnDate,
    required this.productName,
    required this.productImage,
  });
}
