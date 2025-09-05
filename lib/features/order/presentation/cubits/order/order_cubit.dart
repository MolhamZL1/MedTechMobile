import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/features/order/domain/entities/order_entities.dart';
import 'package:medtech_mobile/features/order/domain/repos/order_repo.dart';
import 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepo orderRepo;

  OrderCubit(this.orderRepo) : super(OrderInitial());
  List<OrderEntity> orders = [];
  Future<void> fetchOrders() async {
    emit(OrderLoading());
    final result = await orderRepo.getOrders();
    result.fold((l) => emit(OrderError(l.errMessage)), (r) {
      orders = r;
      emit(OrderLoaded(r));
    });
  }
}
