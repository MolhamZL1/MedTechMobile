import 'package:flutter/material.dart';

class Cityrow extends StatelessWidget {
  const Cityrow({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
                    children: [
                        Text("دمشق - المزة ",  textAlign: TextAlign.left,
                  style: TextStyle(
                        color:  Theme.of(context).textTheme.bodyLarge?.color,
                        
                  ),),
                    ],
                 
                );
  }
}