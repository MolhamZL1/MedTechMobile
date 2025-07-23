import 'package:flutter/material.dart';

class Safetytext1 extends StatelessWidget {
  const Safetytext1({super.key});

  @override
  Widget build(BuildContext context) {
    return 
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Align(alignment: Alignment.centerRight,
            child: Text(
              "إجراءات الأمان",
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.end,
            ),
          ),
        );
  }
}