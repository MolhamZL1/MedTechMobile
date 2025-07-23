import 'package:flutter/material.dart';

class Steetrow extends StatelessWidget {
  const Steetrow({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
               
                  children: [
                   Text("الحي 21 - المزة ", 
                textAlign: TextAlign.right,
                  style: TextStyle(
                        color:  Theme.of(context).textTheme.bodySmall?.color,
                        
                  ),),
                ],);
  }
}