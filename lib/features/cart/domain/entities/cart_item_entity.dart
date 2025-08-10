import 'package:medtech_mobile/features/products/domain/entities/product_entitie.dart';

class CartItemEntity {
  final String id;
  final ProductEntity productModel;
  final int quantity;

  CartItemEntity({
    required this.id,
    required this.productModel,
    required this.quantity,
  });
}
