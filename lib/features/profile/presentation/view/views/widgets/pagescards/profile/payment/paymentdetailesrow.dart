import 'package:flutter/material.dart';

class Paymentdetailesrow extends StatelessWidget {
  const Paymentdetailesrow({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
                    children: [
                        Text("Visa •••• 4532",  textAlign: TextAlign.left,
                  style: TextStyle(
                        color:  Theme.of(context).textTheme.bodyLarge?.color,
                        
                  ),),
                    ],
                 
                );
  }
}