import 'package:flutter/material.dart';

class Mainrolescard extends StatelessWidget {
  const Mainrolescard({super.key});

  @override
  Widget build(BuildContext context) {
    return    Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
      width: double.infinity,
      
      child: Padding(
     padding: EdgeInsets.all(15),
        child: Column(
          children: [
        Icon(Icons.description_outlined,
        color: Colors.blue,size: 25,),
    SizedBox(height: 3,),
        Text('شروط وأحكام الاستخدام',  
            style: Theme.of(context).textTheme.bodyLarge,),
       SizedBox(height: 3,),
         Text(" منصة MediCare للأجهزة الطبية   آخر تحديث: 15 يناير 2024",
               style: Theme.of(context).textTheme.bodySmall,),
        
          ],
        ),
      ),
    );
  }
}