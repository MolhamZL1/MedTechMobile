import 'package:medtech_mobile/features/products/domain/entities/product_entitie.dart';

class CartItemEntity {
  final ProductEntity productEntity;
  int quantity;
  num lineTotal;

  CartItemEntity({
    required this.lineTotal,
    required this.productEntity,
    required this.quantity,
  });
  incrementQuantity() {
    quantity++;
    lineTotal = quantity * productEntity.salePrice;
  }

  decrementQuantity() {
    quantity--;
    lineTotal = quantity * productEntity.salePrice;
  }
}
