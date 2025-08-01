import 'package:flutter/material.dart';

class Text12 extends StatelessWidget {
  const Text12({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
  padding: const EdgeInsets.all(8.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text(
        " الاعدادات",
        style: TextStyle(fontSize: 18),
      ),
    ],
  ),
);

  }
}