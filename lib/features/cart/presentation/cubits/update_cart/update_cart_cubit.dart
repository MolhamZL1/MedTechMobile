import 'package:bloc/bloc.dart';
import 'package:medtech_mobile/features/cart/domain/repos/cart_repo.dart';
import 'package:meta/meta.dart';

part 'update_cart_state.dart';

class UpdateCartCubit extends Cubit<UpdateCartState> {
  UpdateCartCubit(this.cartRepo) : super(UpdateCartInitial());
  final CartRepo cartRepo;
  void updateCart({required String id, required int qty}) async {
    emit(UpdateCartLoading());
    var result = await cartRepo.updateCartItem(id: id, qty: qty);
    result.fold(
      (failure) => emit(UpdateCartError(failure.errMessage)),
      (r) => emit(UpdateCartSuccess()),
    );
  }

  removeCartItem(String id) {
    updateCart(id: id, qty: 0);
  }
}
