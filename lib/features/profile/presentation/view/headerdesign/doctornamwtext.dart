import 'package:flutter/material.dart';

class Doctornamwtext extends StatelessWidget {
   final String name;
  const Doctornamwtext({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Text(name, 
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold) ),
    );
  }
}