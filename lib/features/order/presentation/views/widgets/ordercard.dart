import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/order/domain/entities/order_entities.dart';

class OrderCard extends StatelessWidget {
    final OrderEntity order;
   OrderCard({super.key, required this.order});

  String getStatusText(OrderStatus status) {
    switch (status) {
      case OrderStatus.processing:
        return "قيد المعالجة";
      case OrderStatus.shipped:
        return "تم الشحن";
      case OrderStatus.completed:
        return "مكتمل";
      case OrderStatus.canceled:
        return "ملغي";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row الصورة والطلب
            Row(
              children: [
                Image.asset(
                  order.imageUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                      "#${order.id}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text("${order.date.toLocal()}".split(' ')[0],
                          style: const TextStyle(
                              color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                ),
                const Icon(Icons.local_shipping, color: Colors.green),
              ],
            ),
            const SizedBox(height: 8),
            Text(order.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 4),
            Text("طلب شراء -  ${order.quantity}  قطعة", style: const TextStyle(fontSize: 12)),
            const SizedBox(height: 8),

             if (order.tracking != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(order.tracking!,
                    style: const TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold)),
                          if (order.deliveryDate != null)
                Text("شحن المتوقع: ${order.deliveryDate!.toLocal()}".split(' ')[0],
                    style: const TextStyle(
                        fontSize: 12, color: Colors.redAccent)),
              ],
            ),
            const Divider(height: 16),
            Text("${order.price} ر.س",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("تتبع الشحنة"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
