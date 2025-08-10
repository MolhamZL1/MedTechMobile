import 'package:flutter/material.dart';

class Ratingsection extends StatelessWidget {
  const Ratingsection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('4.9 (127 reviews)', style: const TextStyle(fontSize: 12)),
          const SizedBox(width: 4),
          const Icon(Icons.star, color: Colors.orange, size: 16),
        ],
      ),
    );
  }
}
