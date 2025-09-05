import 'dart:developer';

import '../../data/models/cart_item_model.dart';
import 'cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;
  num total;

  CartEntity(this.cartItems, this.total);
  deleteitem(CartItemEntity cartItemEntity) {
    cartItems.remove(cartItemEntity);
    total -= cartItemEntity.productEntity.salePrice * cartItemEntity.quantity;
  }

  additem(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
    total += cartItemEntity.productEntity.salePrice * cartItemEntity.quantity;
  }

  incrementQuantity(CartItemEntity cartItemEntity) {
    cartItemEntity.incrementQuantity();
    total += cartItemEntity.productEntity.salePrice;
  }

  decrementQuantity(CartItemEntity cartItemEntity) {
    cartItemEntity.decrementQuantity();
    total -= cartItemEntity.productEntity.salePrice;
  }

  List<CartItemEntity> getRentedProducts() {
    List<CartItemEntity> rentedItems = [];
    for (var element in cartItems) {
      if (element.transactionType == TransactionType.rent) {
        rentedItems.add(element);
      }
    }
    return rentedItems;
  }
}
