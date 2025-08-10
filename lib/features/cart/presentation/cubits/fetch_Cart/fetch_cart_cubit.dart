import 'package:bloc/bloc.dart';
import 'package:medtech_mobile/features/cart/domain/entities/cart_item_entity.dart';
import 'package:medtech_mobile/features/cart/domain/repos/cart_repo.dart';
import 'package:meta/meta.dart';

part 'fetch_cart_state.dart';

class FetchCartCubit extends Cubit<FetchCartState> {
  FetchCartCubit(this.cartRepo) : super(FetchCartInitial());
  final CartRepo cartRepo;
  List<CartItemEntity> cartItems = [];
  fetchCart() async {
    emit(FetchCartLoading());
    var result = await cartRepo.getCartItems();
    result.fold((err) => FetchCartError(err.toString()), (items) {
      cartItems = items;
      FetchCartSuccess(items);
    });
  }
}
