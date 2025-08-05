import 'package:flutter/material.dart';

class Emailcard extends StatelessWidget {
  const Emailcard({super.key});

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
                color: Colors.orange.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.email_outlined,
                color: Colors.orange,
                size: 20,
              ),
            ),
            Spacer(),
    
          
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children:  [
                Text(
                  ' البريد الالكتروني    ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                 'support@.com',
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