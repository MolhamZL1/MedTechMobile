import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medtech_mobile/core/utils/app_colors.dart';

class Rentbotton extends StatelessWidget {
  const Rentbotton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
                child: Material(
                   borderRadius: BorderRadius.circular(15),
           
                  child: InkWell(
                       borderRadius: BorderRadius.circular(15),
                      onTap: (){},
                    child: Container(
                   padding: EdgeInsets.all(17),
                      
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.primary,
                          width: 1
                        ),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Rent",style: TextStyle(color: AppColors.primary)),
                    SizedBox(width:10 ,), 
                          Icon(FontAwesomeIcons.calendar,color: AppColors.primary)
                        ],
                      ) ,
                    ),
                  ),
                ),
              );
  }
}