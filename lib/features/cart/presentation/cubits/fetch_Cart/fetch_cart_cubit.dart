import 'package:bloc/bloc.dart';
import 'package:medtech_mobile/features/cart/data/models/cart_item_model.dart';
import 'package:medtech_mobile/features/cart/domain/entities/cart_entity.dart';
import 'package:medtech_mobile/features/cart/domain/entities/cart_item_entity.dart';
import 'package:medtech_mobile/features/cart/domain/repos/cart_repo.dart';
import 'package:medtech_mobile/features/cart/presentation/cubits/update_cart/update_cart_cubit.dart';
import 'package:meta/meta.dart';

import '../../../../../core/services/get_it_service.dart';

part 'fetch_cart_state.dart';

class FetchCartCubit extends Cubit<FetchCartState> {
  FetchCartCubit(this.cartRepo) : super(FetchCartInitial());
  final CartRepo cartRepo;
  CartEntity? cartEntity;
  fetchCart() async {
    emit(FetchCartLoading());
    var result = await cartRepo.getCartItems();
    result.fold((err) => FetchCartError(err.toString()), (item) {
      cartEntity = item;
      emit(FetchCartSuccess(item));
    });
  }

  increment(CartItemEntity item) {
    cartEntity!.incrementQuantity(
      cartEntity!.cartItems.firstWhere(
        (e) => e.productEntity.id == item.productEntity.id,
      ),
    );
    emit(FetchCartSuccess(cartEntity!));
    UpdateCartCubit(getIt.get<CartRepo>()).updateCart(
      id: item.productEntity.id.toString(),
      qty: item.quantity,
      transactionType: item.transactionType,
    );
  }

  decrement(CartItemEntity item) {
    if (item.quantity < 1) {
      emit(FetchCartError("Quantity can't be less than 1"));
      return;
    }
    cartEntity!.decrementQuantity(
      cartEntity!.cartItems.firstWhere(
        (e) => e.productEntity.id == item.productEntity.id,
      ),
    );
    emit(FetchCartSuccess(cartEntity!));
    UpdateCartCubit(getIt.get<CartRepo>()).updateCart(
      id: item.productEntity.id.toString(),
      qty: item.quantity,
      transactionType: item.transactionType,
    );
  }

  deleteCartItem({required CartItemEntity item}) async {
    cartEntity!.deleteitem(item);
    emit(FetchCartSuccess(cartEntity!));
    UpdateCartCubit(
      getIt.get<CartRepo>(),
    ).removeCartItem(item.productEntity.id.toString());
  }
}
