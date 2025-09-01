import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/features/order/domain/repos/order_repo.dart';
import 'order_state.dart';


class OrderCubit extends Cubit<OrderState> {
  final OrderRepo  repository;

  OrderCubit(this.repository) : super(OrderInitial());

  Future<void> fetchOrders() async {
    try {
      emit(OrderLoading());
      final orders = await repository.getOrders();
      emit(OrderLoaded(orders));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }
}
