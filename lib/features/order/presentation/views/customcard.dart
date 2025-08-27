import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/order/domain/entities/card_order_model.dart';
import 'package:medtech_mobile/features/order/domain/entities/order_entities.dart';
import 'package:medtech_mobile/features/order/presentation/views/widgets/ordercard.dart';

class Customcard extends StatelessWidget {
  final int selectedStatus;
   Customcard({super.key, required this.selectedStatus});


  List<OrderModel> get filteredOrders {
    switch (selectedStatus) {
      case 1: 
        return orders.where((o) => o.status == OrderStatus.processing).toList();
      case 2:
        return orders.where((o) => o.status == OrderStatus.completed).toList();
      case 3: 
        return orders.where((o) => o.status == OrderStatus.canceled).toList();
      default: 
        return orders;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return  Expanded(
              child: Container(
                color: Colors.grey[100],
                child: ListView.builder(
                  itemCount: filteredOrders.length,
                  itemBuilder: (context, index) {
                    return OrderCard(order: filteredOrders[index]);
                  },
                ),
              ),
            );
  }
}