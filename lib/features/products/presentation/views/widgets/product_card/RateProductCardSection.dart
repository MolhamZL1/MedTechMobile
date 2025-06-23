import 'package:flutter/material.dart';

import '../../../../domain/entities/product_entitie.dart';

class RateProductCardSection extends StatelessWidget {
  const RateProductCardSection({super.key, required this.productEntitie});

  final ProductEntitie productEntitie;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.orange, size: 16),
        const SizedBox(width: 4),
        Text(
          '${productEntitie.rate} (${productEntitie.ratingCount})',
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
