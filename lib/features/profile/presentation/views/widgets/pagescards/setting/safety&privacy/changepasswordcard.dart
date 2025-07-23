import 'package:flutter/material.dart';

class Changepasswordcard extends StatefulWidget {
  const Changepasswordcard({super.key});

  @override
  State<Changepasswordcard> createState() => _ChangepasswordcardState();
}

class _ChangepasswordcardState extends State<Changepasswordcard> {
 
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
                Icons.vpn_key_outlined,
                color: Colors.blue,
                size: 20,
              ),
            ),
            Spacer(),
    
          
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children:  [
                Text(
                  "تغيير كلمة المرور",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  "تحديث كلمة المرور الخاصة بحسابك",
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
