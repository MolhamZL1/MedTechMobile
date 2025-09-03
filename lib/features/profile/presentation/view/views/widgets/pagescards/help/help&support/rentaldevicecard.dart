import 'package:flutter/material.dart';

class Rentaldevicecard extends StatelessWidget {
  const Rentaldevicecard({super.key});

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
        color: const Color.fromARGB(255, 215, 211, 211).withOpacity(0.5), // Shadow color
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
                ' كيف يمكنني تأجير جهاز طبي؟ ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                ' يمكنك تصفح الأجهزة المتاحة للتأجير من خلال قسم "البحث" ثم اختيار المنتج المطلوب وتحديد فترة التأجير ',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}