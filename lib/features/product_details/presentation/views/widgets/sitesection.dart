import 'package:flutter/material.dart';


class Sitesection extends StatelessWidget {
  const Sitesection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.my_location, size: 16),
          const SizedBox(width: 4),
          Text(
            'medical center downtoun',
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
