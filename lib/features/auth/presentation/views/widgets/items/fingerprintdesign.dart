import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medtech_mobile/core/utils/app_colors.dart';
import 'package:medtech_mobile/features/auth/presentation/views/widgets/items/customdriver.dart';


 buildfingerprintBlocBuilder() {
 
        return GestureDetector(
            onTap: () {
            
            },
            child: Column(
                children: [
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 25),
                 child: Customdriver(text: 'OR',),
               ),
                  SizedBox(height: 30),

                  Transform.rotate(
                    angle: -.43,
                    
                  ),


                ]));
      }
  