import 'package:flutter/material.dart';

class Deleteaccountcard extends StatelessWidget {
  const Deleteaccountcard({super.key});

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
                color: Colors.red.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.delete_outline,
                color: Colors.red,
                size: 20,
              ),
            ),
           Spacer(),
    
          
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children:  [
                Text(
                  'حذف الحساب ',
                  style: TextStyle(fontWeight: FontWeight.bold,),
                ),
                SizedBox(height: 4),
                Text(
                  "حذف حسابك وجميع البيانات المرتبطة به نهائيا ",
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
