import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/toturialcarddesign/tutorialcard.dart';

class Totuialssection extends StatelessWidget {


  const Totuialssection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: 
         ListView.builder(
        padding: EdgeInsets.all(10),
          itemCount: 8,
           scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
           return
             tutorialcard();
          }
          
          ),
      );
  
      }
  }
