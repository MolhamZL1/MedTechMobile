import 'package:flutter/material.dart';

class Constcard extends StatelessWidget {
  const Constcard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Card(
                    
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                children: [
                  Row(
                    children: [
                   
                      Icon(Icons.shield_outlined,color: Colors.green,),
                      SizedBox(width: 3,),
                         Text('حسابك محمي',style: TextStyle(
                          fontWeight: FontWeight.bold
                         ),),
                    ],
                  ),
                  Text('نحن نستخدم أحدث تقنيات التشفير لحماية بياناتك الشخصية والطبية',
                style: TextStyle(color:  Theme.of(context).textTheme.bodySmall?.color),      ),
                    Container(
                    
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(7),
                      child: Text('مستوى الأمان:   عالي '),
                    decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 77, 240, 83).withOpacity(0.3),
                    ),)
                ], 
                            ),
              ),);
  }
}