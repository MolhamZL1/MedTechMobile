import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:medtech_mobile/features/checkout/domain/repos/checkout_repo.dart';

import '../../../data/model/rentedItemmodel.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this.checkoutRepo) : super(CheckoutInitial());
  final CheckoutRepo checkoutRepo;
  void checkout({
    required String address,
    required List<Renteditemmodel> rentedItems,
  }) async {
    emit(CheckoutLoading());
    var result = await checkoutRepo.checkout(
      address: address,
      rentedItems: rentedItems,
    );
    result.fold((failure) => emit(CheckoutFailure(failure.errMessage)), (r) {
      emit(CheckoutSuccess());
    });
  }
}
