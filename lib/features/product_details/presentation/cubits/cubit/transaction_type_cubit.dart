import 'package:bloc/bloc.dart';
import 'package:medtech_mobile/features/cart/data/models/cart_item_model.dart';
import 'package:meta/meta.dart';

part 'transaction_type_state.dart';

class TransactionTypeCubit extends Cubit<String> {
  TransactionTypeCubit() : super(TransactionType.sale);

  void changeTransactionType(String transactionType) {
    emit(transactionType);
  }

  getTransactionType() => state;
}
