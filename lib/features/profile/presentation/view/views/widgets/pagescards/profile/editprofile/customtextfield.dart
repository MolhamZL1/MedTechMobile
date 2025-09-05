import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
  String text;
  String title;
  IconData? icon;
  TextEditingController? controller;
   Customtextfield({super.key, required this.text,
   required this.icon,required this.title,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(alignment: Alignment.centerRight,
          child: Text(text)),
        SizedBox(height: 4,),
      TextFormField(
    controller: controller,
    textAlign: TextAlign.right,
    
      decoration: InputDecoration(
        
          hintText: title,
        prefixIcon: Icon(icon),
         enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Colors.grey, // لون البوردر
        width: 1,
      ),
    ),
    
    // البوردر عند الفوكس (الضغط على الفيلد)
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Colors.blue, // لون البوردر وقت الفوكس
        width: 1,
      ),
      
    ),
      ),
      
   )
      ],
    );
  }
}