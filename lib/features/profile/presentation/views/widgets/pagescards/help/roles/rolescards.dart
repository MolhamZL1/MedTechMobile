import 'package:flutter/material.dart';

class Rolescards extends StatelessWidget {
  String text1;
  String text2;
   Rolescards({super.key,required this.text1,required this.text2 });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
            width: double.infinity,
       decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
         boxShadow: [
      BoxShadow(
        color: const Color.fromARGB(255, 215, 211, 211).withOpacity(0.5), 
        spreadRadius: 1, 
        blurRadius: 5,
        offset: Offset(0, 5), 
      ),
    ],
       ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children:  [
              Text(
              text1,textAlign: TextAlign.right, 
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
               text2,textAlign: TextAlign.right, 
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}