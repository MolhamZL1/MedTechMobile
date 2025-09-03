import 'package:flutter/material.dart';

class Biometriccheck extends StatefulWidget {
  const Biometriccheck({super.key});

  @override
  State<Biometriccheck> createState() => _BiometriccheckState();
}

class _BiometriccheckState extends State<Biometriccheck> {
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
                color: Colors.green.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.fingerprint_outlined,
                color: Colors.green,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
    
          
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    "المصادقة البيومترية",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'استخدام بصمة الإصبع لتسجيل الدخول',
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
              activeColor: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
