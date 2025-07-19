import 'package:flutter/material.dart';

class Timesection extends StatelessWidget {
  const Timesection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text("2:15",   textDirection: TextDirection.ltr,)),
    );
  }
}