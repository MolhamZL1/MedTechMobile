import 'package:flutter/material.dart';

class Cancelordercard extends StatelessWidget {
  const Cancelordercard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
            width: double.infinity,
       decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
         boxShadow: [
      BoxShadow(
        color: const Color.fromARGB(255, 215, 211, 211).withOpacity(0.5), // Shadow color
        spreadRadius: 1, // Spread radius
        blurRadius: 5, // Blur radius
        offset: Offset(0, 5), // Shadow position (x, y)
      ),
    ],
       ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children:  [
              Text(
                'هل يمكنني إلغاء طلب التأجير؟',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                'نعم، يمكنك إلغاء طلب التأجير قبل 24 ساعة من موعد التسليم دون أي رسوم إضافية.',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}