import 'package:flutter/material.dart';

class Email extends StatelessWidget {
   final String email; 
  const Email({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.all(4),
      child: Text(email,
       style:  TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }
}