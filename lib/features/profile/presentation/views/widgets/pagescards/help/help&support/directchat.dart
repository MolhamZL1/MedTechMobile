import 'package:flutter/material.dart';

class Directchat extends StatelessWidget {
  const Directchat({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
         
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.chat,
                color: Colors.blue,
                size: 20,
              ),
            ),
            Spacer(),
    
          
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children:  [
                Text(
                  'الدردشة المباشرة ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'تحدث مع فريق الدعم الان ',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
    
           
           
          ],
        ),
      ),
    );
  }
}