import 'package:flutter/material.dart';

class Notificationswitchcard extends StatefulWidget {
  const Notificationswitchcard({super.key});

  @override
  State<Notificationswitchcard> createState() => _DarkthemecardState();
}

class _DarkthemecardState extends State<Notificationswitchcard> {
 bool _isSwitched = true;  
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
                color: Colors.purple.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.notifications_outlined,
                color: Colors.purple,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
    
          
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    'تفعيل الاشعارات ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'تفعيل اشعارات التطبيق ',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
    
           
            Switch(
              value: _isSwitched,
              onChanged: (value) {
                setState(() {
                      _isSwitched = value;
                    });
              },
              activeColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
