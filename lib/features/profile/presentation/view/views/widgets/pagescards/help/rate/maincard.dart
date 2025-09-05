import 'package:flutter/material.dart';

class Maincard extends StatelessWidget {
  const Maincard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
      width: double.infinity,
      
      child: Padding(
     padding: EdgeInsets.all(15),
        child: Column(
          children: [
        Icon(Icons.star,
        color: Colors.orange,size: 25,),
    
        Text('ما رأيك في تطبيق MediCare؟',  
            style: Theme.of(context).textTheme.bodyLarge,),
     
         Text('تقييمك يساعدنا على تحسين خدماتنا وتطوير تجربة أفضل لجميع المستخدمين',
               style: Theme.of(context).textTheme.bodySmall,),
        
          ],
        ),
      ),
    );
  }
}