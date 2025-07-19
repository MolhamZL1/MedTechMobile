import 'package:flutter/material.dart';
import 'package:medtech_mobile/core/utils/app_colors.dart';

class Pricecolumn extends StatelessWidget {
  const Pricecolumn({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 50,
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text("\$ 2,200,000",
           style: TextStyle(fontSize: 20,color: AppColors.primary),),
     
             Text(
              "Purchase Price"
             ,style: TextStyle(fontSize: 10,
            color:  Theme.of(context).textTheme.bodySmall?.color,),
                         
             ),
        ],),
    );
  }
}