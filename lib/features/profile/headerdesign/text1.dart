import 'package:flutter/material.dart';

class Text11 extends StatelessWidget {
  const Text11({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
  padding: const EdgeInsets.all(8.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text(
        "الملف الشخصي",
        style: TextStyle(fontSize: 18),
      ),
    ],
  ),
);

  }
}