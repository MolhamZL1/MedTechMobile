import 'package:flutter/material.dart';

class Custombuttom extends StatelessWidget {
  @required void Function()? onPressed;
  @required String text ;
   double width= double.infinity;
  @required  Color Tcolor;
  Color? BColor;
  double? fontSize = 10;
   bool isUppercase= true;
  double radius= 20;
 // FontWeight? fontWeight = FontWeight.bold;
   Custombuttom({super.key,this.onPressed,required this.text,required  this.Tcolor,this.BColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Container(
         
        width:width ,
        height: 50,
         decoration: BoxDecoration(
                  color: BColor,
            borderRadius: BorderRadius.circular(radius)),
        child:MaterialButton(
          onPressed: onPressed,
         
              child: Text(
                isUppercase ? text.toUpperCase() : text,
                style: TextStyle(
                  color:Tcolor, 
                 fontSize: 17,fontWeight: FontWeight.bold
                ),
               
              ),
              
              ),
             
        ),
    );
  }
}