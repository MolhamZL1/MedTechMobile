import 'package:bloc/bloc.dart';
import 'package:medtech_mobile/features/cart/data/models/cart_item_model.dart';
import 'package:medtech_mobile/features/cart/domain/repos/cart_repo.dart';
import 'package:meta/meta.dart';

part 'update_cart_state.dart';

class UpdateCartCubit extends Cubit<UpdateCartState> {
  UpdateCartCubit(this.cartRepo) : super(UpdateCartInitial());
  final CartRepo cartRepo;
  String transitionType = TransactionType.sale;
  void updateCart({
    required String id,
    required int qty,
    String transactionType = "",
  }) async {
    emit(UpdateCartLoading());
    var result = await cartRepo.updateCartItem(
      id: id,
      qty: qty,
      transactionType: transactionType,
    );
    result.fold(
      (failure) => emit(UpdateCartError(failure.errMessage)),
      (r) => emit(UpdateCartSuccess()),
    );
  }

  removeCartItem(String id) {
    updateCart(id: id, qty: 0);
  }
}
