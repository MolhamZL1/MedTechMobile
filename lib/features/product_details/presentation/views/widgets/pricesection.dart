import 'package:flutter/material.dart';
import 'package:medtech_mobile/core/utils/app_colors.dart';
import 'package:medtech_mobile/features/products/domain/entities/prodetailes_entites.dart';

class Pricesection extends StatelessWidget {
  const Pricesection({super.key,
   });

//  final ProdetailesEntites prodetailesEntitie;
  @override
  Widget build(BuildContext context) {
    return      Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
              children: [
                    Text('\$2,200,000,000',
                    style: TextStyle(color: AppColors.primary,
                    fontWeight: FontWeight.bold,fontSize: 25
                    ),),
                      SizedBox(width: 15,),
                Text('\$2,200,000,000',
              
                 style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 20
                  ),),
                
              
      
              ],
            ),
    );
  }
}