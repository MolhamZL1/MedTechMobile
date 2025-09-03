import 'package:flutter/material.dart';

class Constnotificationcard extends StatelessWidget {
  const Constnotificationcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
                    
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                   
                      Icon(Icons.notifications,color: Colors.purple,),
                      SizedBox(width: 3,),
                         Text('الإشعارات العامة',
                       
                         style: TextStyle(
                          fontWeight: FontWeight.bold
                         ),),
                    ],
                  ),
                  Text('تحكم في جميع الإشعارات التي تتلقاها من تطبيق MediCare',
                style: TextStyle(color:  Theme.of(context).textTheme.bodySmall?.color),      ),
                  
                ], 
                            ),
              ),);
  }
}