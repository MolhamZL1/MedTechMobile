import 'package:flutter/material.dart';

class Darkthemecard extends StatefulWidget {
  const Darkthemecard({super.key});

  @override
  State<Darkthemecard> createState() => _DarkthemecardState();
}

class _DarkthemecardState extends State<Darkthemecard> {
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
                Icons.dark_mode_outlined,
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
                    'الوضع الليلي ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'تغعيل المظهر الداكن ',
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
