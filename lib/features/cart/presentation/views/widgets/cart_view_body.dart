import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/features/cart/presentation/cubits/fetch_Cart/fetch_cart_cubit.dart';

class CartviewBody extends StatelessWidget {
  const CartviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          children: [
            ListTile(
              title: Text(
                "Cart",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              trailing: Text(
                "${context.read<FetchCartCubit>().cartItems.length} items",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Expanded(child: ListView(children: [CartItemWidget()])),
            SummaryOrderWidget(deliveryFee: 55, orderPrice: 55),
            SizedBox(height: 80),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Colors.grey.shade300)),
          ),
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.check),
            label: Text("Checkout"),
          ),
        ),
      ],
    );
  }
}

class SummaryOrderWidget extends StatelessWidget {
  final double orderPrice;
  final double deliveryFee;

  const SummaryOrderWidget({
    super.key,
    required this.orderPrice,
    required this.deliveryFee,
  });

  @override
  Widget build(BuildContext context) {
    final double total = orderPrice + deliveryFee;

    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildRow('Order', orderPrice),
            const SizedBox(height: 8),
            _buildRow('Delivery', deliveryFee),
            const Divider(height: 32),
            _buildRow('Total', total, isBold: true),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String title, double value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style:
              isBold
                  ? const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
                  : const TextStyle(fontSize: 14),
        ),
        Text(
          '${value.toStringAsFixed(2)} \$',
          style:
              isBold
                  ? const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
                  : const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                "imageUrl",
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) =>
                        const Icon(Icons.broken_image, size: 80),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "title",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "",
                    //  '${price.toStringAsFixed(2)} \$',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.remove_circle_outline),
                      ),
                      Text('5'),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add_circle_outline),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
