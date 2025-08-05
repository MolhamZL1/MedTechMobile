import 'package:medtech_mobile/features/products/data/models/product_model.dart';

class CartItemModel {
  final String id;
  final ProductModel productModel;
  final int quantity;

  CartItemModel({
    required this.id,
    required this.productModel,
    required this.quantity,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
    id: json['id'],
    productModel: ProductModel.fromJson(json['product']),
    quantity: json['quantity'],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product": productModel.toJson(),
    "quantity": quantity,
  };
  toEntity() =>
      CartItemModel(id: id, productModel: productModel, quantity: quantity);
}
