import 'package:medtech_mobile/features/cart/domain/entities/cart_entity.dart';

import '../../domain/entities/cart_item_entity.dart';
import 'cart_item_model.dart';

class CartModel {
  final List<CartItemModel> cartItems;
  final num total;

  CartModel({required this.cartItems, required this.total});
  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    cartItems:
        json['cartitems']
            .map<CartItemModel>((e) => CartItemModel.fromJson(e))
            .toList(),
    total: json['totalPrice'],
  );

  CartEntity toEntity() => CartEntity(
    cartItems.map<CartItemEntity>((e) => e.toEntity()).toList(),
    total,
  );
}
