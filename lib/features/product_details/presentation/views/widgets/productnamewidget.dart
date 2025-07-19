import 'package:flutter/material.dart';

class Productnamewidget extends StatelessWidget {
  const Productnamewidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
  child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [

    Container(
             padding: EdgeInsets.all(5), 
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 74, 214, 78).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text('availabe', style: const TextStyle(
                  color:const Color.fromARGB(255, 74, 214, 78))),
              ),
             
                Text("MRI SCANNER 3T SIEMENCE MAGNEOM ",
                  maxLines: 2,),
  ],),
);
  }
}