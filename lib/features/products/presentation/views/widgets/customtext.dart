import 'package:flutter/material.dart';

class Customtext extends StatelessWidget {
  String text;
   Customtext({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical:20 ),
              child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      text,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
            );
  }
}