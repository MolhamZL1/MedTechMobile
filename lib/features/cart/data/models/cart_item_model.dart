import 'package:medtech_mobile/features/cart/domain/entities/cart_item_entity.dart';
import 'package:medtech_mobile/features/products/data/models/product_model.dart';

class CartItemModel {
  final ProductModel productModel;
  final int quantity;
  final num lineTotal;
  final String transactionType;
  final num id;

  CartItemModel({
    required this.id,
    required this.transactionType,
    required this.lineTotal,
    required this.productModel,
    required this.quantity,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
    productModel: ProductModel.fromJson(json['product']),
    quantity: json['quantity'],
    lineTotal: json["lineTotal"],
    transactionType: json["transactionType"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "product": productModel.toJson(),
    "quantity": quantity,
    "transactionType": transactionType,
    "id": id,
  };
  toEntity() => CartItemEntity(
    productEntity: productModel.toEntity(),
    quantity: quantity,
    lineTotal: lineTotal,
    transactionType: transactionType,
    id: id,
  );
}

abstract class TransactionType {
  static const String sale = "SALE";
  static const String rent = "RENT";
}
