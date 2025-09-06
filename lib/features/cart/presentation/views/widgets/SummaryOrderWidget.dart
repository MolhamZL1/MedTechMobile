import 'package:flutter/material.dart';

class SummaryOrderWidget extends StatelessWidget {
  final double orderPrice;

  const SummaryOrderWidget({super.key, required this.orderPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildRow('Total (Only purchases) ', orderPrice, isBold: true),
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
