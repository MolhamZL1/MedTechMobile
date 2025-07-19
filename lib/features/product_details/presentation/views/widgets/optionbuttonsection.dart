import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/buybutton.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/rentbotton.dart';

class Optionbuttonsection extends StatelessWidget {
  const Optionbuttonsection({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
               Buybutton(),
               SizedBox(width: 12,),
              Rentbotton(),
              ],),
    );
  }
}