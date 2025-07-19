import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medtech_mobile/core/utils/app_colors.dart';

class Buybutton extends StatelessWidget {
  const Buybutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
    borderRadius: BorderRadius.circular(15),
    color:AppColors.primary ,
        child: InkWell(
           borderRadius: BorderRadius.circular(15),

             onTap: (){
              print("buied");
             },
          child: Container(
            padding: EdgeInsets.all(17),
          
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Buy",style: TextStyle(color: Colors.white),),
                SizedBox(width: 10),
                Icon(FontAwesomeIcons.cartShopping,color:Colors.white ,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
