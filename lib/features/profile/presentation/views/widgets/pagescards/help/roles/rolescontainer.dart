import 'package:flutter/material.dart';

class Rolescontainer extends StatelessWidget {
  const Rolescontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.blue.withOpacity(0.2)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 17),
            child: Text(
              "باستخدامك لتطبيق MediCare، فإنك تقر بأنك قد قرأت وفهمت ووافقت على جميع الشروط والأحكام المذكورة أعلاه.",
            textAlign: TextAlign.right, 
            style: TextStyle(color: const Color.fromARGB(255, 10, 98, 170),),
            ),
          ),
          );
  }
}