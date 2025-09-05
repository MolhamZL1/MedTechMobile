import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/profile/sitepage/cityrow.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/profile/sitepage/row1.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/profile/sitepage/steetrow.dart';

class Sitecard1 extends StatelessWidget {
  const Sitecard1({super.key});

  @override
  Widget build(BuildContext context) {
    return  Card(

        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
             mainAxisSize: MainAxisSize.min, 
            children: [
               Row1(),
               Cityrow(),
                SizedBox(height: 5,),
               Steetrow(),
      
            ],
          ),
        ),
      );
  }
}