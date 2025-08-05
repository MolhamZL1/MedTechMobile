import 'package:flutter/material.dart';
import 'package:medtech_mobile/core/utils/app_colors.dart';

class Logoutbutton extends StatelessWidget {
  const Logoutbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Material(
       borderRadius: BorderRadius.circular(15),
               
      child: InkWell(
           borderRadius: BorderRadius.circular(15),
          onTap: (){},
        child: Container(
       padding: EdgeInsets.all(17),
        
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.red.withOpacity( 0.3,),
              width: 1
            ),
            borderRadius: BorderRadius.circular(15)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                   Icon( Icons.logout,color: Colors.red),
                     SizedBox(width:10 ,), 
              Text("تسجيل الخروج ",style: TextStyle(color: Colors.red)),
      
         
            ],
          ) ,
        ),
      ),
    );
  }
}