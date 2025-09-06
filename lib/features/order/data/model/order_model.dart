import 'package:medtech_mobile/core/services/api_service.dart';
import 'package:medtech_mobile/core/utils/backend_endpoints.dart';

import '../../../cart/data/models/cart_item_model.dart';
import '../../../products/data/models/product_model.dart';
import '../../domain/entities/order_entities.dart';

class OrderModel {
  final int id;
  final int userId;
  final OrderStatus status;
  final num totalAmount;
  final String shippingAddress;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<OrderItemModel> items;

  const OrderModel({
    required this.id,
    required this.userId,
    required this.status,
    required this.totalAmount,
    required this.shippingAddress,
    required this.createdAt,
    required this.updatedAt,
    required this.items,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    DateTime _mustParse(dynamic v) => DateTime.parse(
      v.toString(),
    ); // يرمي خطأ إذا فاسد (يساعد بالاكتشاف المبكر)

    return OrderModel(
      id: json['id'] as int,
      userId: json['userId'] as int,
      status: orderStatusFromString(json['status']?.toString()),
      totalAmount: (json['totalAmount'] as num?) ?? 0,
      shippingAddress: (json['shippingAddress'] ?? '') as String,
      createdAt: _mustParse(json['createdAt']),
      updatedAt: _mustParse(json['updatedAt']),
      items:
          (json['items'] as List<dynamic>? ?? const [])
              .map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }
  factory OrderModel.fromEntity(OrderEntity entity) => OrderModel(
    id: entity.id,
    userId: entity.userId,
    status: entity.status,
    totalAmount: entity.totalAmount,
    shippingAddress: entity.shippingAddress,
    createdAt: entity.createdAt,
    updatedAt: entity.updatedAt,
    items: List<OrderItemModel>.from(
      entity.items.map((x) => OrderItemModel.fromEntity(x)),
    ),
  );
  toEntity() => OrderEntity(
    id: id,
    userId: userId,
    status: status,
    totalAmount: totalAmount,
    shippingAddress: shippingAddress,
    createdAt: createdAt,
    updatedAt: updatedAt,
    items: List<OrderItemEntity>.from(items.map((x) => x.toEntity())),
  );
  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'status': orderStatusToString(status),
    'totalAmount': totalAmount,
    'shippingAddress': shippingAddress,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
    'items': items.map((e) => e.toJson()).toList(),
  };
}

class OrderItemModel {
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

  const OrderItemModel({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.quantity,
    required this.transactionType,
    required this.priceAtTimeOfTransaction,
    this.costAtTimeOfTransaction,
    this.extendedContractId,
    this.newEndDateForExtension,
    this.rentalStartDate,
    this.rentalEndDate,
    this.returnDate,
    required this.productName,
    required this.productImage,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    DateTime? _parseDate(dynamic v) =>
        (v == null) ? null : DateTime.tryParse(v.toString());

    return OrderItemModel(
      id: json['id'] as int,
      orderId: json['orderId'] as int,
      productId: json['productId'] as int,
      quantity: (json['quantity'] ?? 0) as int,
      transactionType: json['transactionType'],

      priceAtTimeOfTransaction: (json['priceAtTimeOfTransaction'] as num?) ?? 0,
      costAtTimeOfTransaction: json['costAtTimeOfTransaction'] as num?,
      extendedContractId: json['extendedContractId'] as int?,
      newEndDateForExtension: _parseDate(json['newEndDateForExtension']),
      rentalStartDate: _parseDate(json['rentalStartDate']),
      rentalEndDate: _parseDate(json['rentalEndDate']),
      returnDate: _parseDate(json['returnDate']),
      productName: json["product"]['nameEn'] as String,
      productImage: json["product"]['images'][0] as String,
    );
  }
  factory OrderItemModel.fromEntity(OrderItemEntity entity) => OrderItemModel(
    id: entity.id,
    orderId: entity.orderId,
    productId: entity.productId,
    quantity: entity.quantity,
    transactionType: entity.transactionType,
    priceAtTimeOfTransaction: entity.priceAtTimeOfTransaction,
    costAtTimeOfTransaction: entity.costAtTimeOfTransaction,
    extendedContractId: entity.extendedContractId,
    newEndDateForExtension: entity.newEndDateForExtension,
    rentalStartDate: entity.rentalStartDate,
    rentalEndDate: entity.rentalEndDate,
    returnDate: entity.returnDate,
    productName: entity.productName,
    productImage: entity.productImage,
  );
  toEntity() => OrderItemEntity(
    id: id,
    orderId: orderId,
    productId: productId,
    quantity: quantity,
    transactionType: transactionType,
    priceAtTimeOfTransaction: priceAtTimeOfTransaction,
    costAtTimeOfTransaction: costAtTimeOfTransaction,
    extendedContractId: extendedContractId,
    newEndDateForExtension: newEndDateForExtension,
    rentalStartDate: rentalStartDate,
    rentalEndDate: rentalEndDate,
    returnDate: returnDate,
    productName: productName,
    productImage: BackendEndpoints.url + productImage,
  );
  Map<String, dynamic> toJson() => {
    'id': id,
    'orderId': orderId,
    'productId': productId,
    'quantity': quantity,
    'transactionType': transactionType,
    'priceAtTimeOfTransaction': priceAtTimeOfTransaction,
    'costAtTimeOfTransaction': costAtTimeOfTransaction,
    'extendedContractId': extendedContractId,
    'newEndDateForExtension': newEndDateForExtension?.toIso8601String(),
    'rentalStartDate': rentalStartDate?.toIso8601String(),
    'rentalEndDate': rentalEndDate?.toIso8601String(),
    'returnDate': returnDate?.toIso8601String(),
    'productName': productName,
    'productImage': productImage,
  };
}

enum OrderStatus { PENDING, APPROVED, REJECTED, CANCELLED, COMPLETED }

OrderStatus orderStatusFromString(String? v) {
  switch (v) {
    case 'PENDING':
      return OrderStatus.PENDING;
    case 'APPROVED':
      return OrderStatus.APPROVED;
    case 'REJECTED':
      return OrderStatus.REJECTED;
    case 'CANCELLED':
      return OrderStatus.CANCELLED;
    case 'COMPLETED':
      return OrderStatus.COMPLETED;
    default:
      return OrderStatus.PENDING; // fallback آمن
  }
}

String orderStatusToString(OrderStatus s) => s.name;
