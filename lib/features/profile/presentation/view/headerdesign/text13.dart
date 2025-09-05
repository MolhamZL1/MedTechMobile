import 'package:flutter/material.dart';

class Text13 extends StatelessWidget {
  const Text13({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
  padding: const EdgeInsets.all(8.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text(
        "الدعم والمساعدة ",
        style: TextStyle(fontSize: 18),
      ),
    ],
  ),
);

  }
}