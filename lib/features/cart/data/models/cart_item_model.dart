import 'package:medtech_mobile/features/cart/domain/entities/cart_item_entity.dart';
import 'package:medtech_mobile/features/products/data/models/product_model.dart';

class CartItemModel {
  final ProductModel productModel;
  final int quantity;
  final num lineTotal;

  CartItemModel({
    required this.lineTotal,
    required this.productModel,
    required this.quantity,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
    productModel: ProductModel.fromJson(json['product']),
    quantity: json['quantity'],
    lineTotal: json["lineTotal"],
  );

  Map<String, dynamic> toJson() => {
    "product": productModel.toJson(),
    "quantity": quantity,
  };
  toEntity() => CartItemEntity(
    productEntity: productModel.toEntity(),
    quantity: quantity,
    lineTotal: lineTotal,
  );
}
