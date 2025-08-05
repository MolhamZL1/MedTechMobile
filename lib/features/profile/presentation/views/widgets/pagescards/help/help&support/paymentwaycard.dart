import 'package:flutter/material.dart';

class Paymentwaycard extends StatelessWidget {
  const Paymentwaycard({super.key});

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
                'كيف يتم الدفع؟',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
      'نقبل الدفع بالبطاقات الائتمانية، المحافظ الرقمية، أو الدفع عند الاستلام حسب نوع الخدمة',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}