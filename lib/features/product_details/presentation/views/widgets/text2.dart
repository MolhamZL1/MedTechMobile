import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/ratingsection.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/sitesection.dart';

class Text2 extends StatelessWidget {
  const Text2({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
      child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Sitesection(),
                  Ratingsection(),
                
      
             ],),
    );
  }
}