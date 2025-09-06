import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/services/get_it_service.dart';
import 'package:medtech_mobile/features/order/domain/repos/order_repo.dart';
import 'package:medtech_mobile/features/order/presentation/cubits/order/order_cubit.dart';
import 'package:medtech_mobile/features/order/presentation/views/widgets/order_view_body.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => OrderCubit(getIt.get<OrderRepo>())..fetchOrders(),
        child: OrderViewBody(),
      ),
    );
  }
}
