import 'package:flutter/material.dart';

class Paymentdaterow extends StatelessWidget {
  const Paymentdaterow({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
                  children: [
                   Text("ينتهي في 12/26", 
                textAlign: TextAlign.right,
                  style: TextStyle(
                        color:  Theme.of(context).textTheme.bodySmall?.color,
                        
                  ),),
                ],);
  }
}