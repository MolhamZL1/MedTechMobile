import 'package:flutter/material.dart';

class Toturialtitle extends StatelessWidget {
  const Toturialtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      
      child: Align(
        alignment: Alignment.centerLeft,
     
        child: Text("Basic operation toturial",   textDirection: TextDirection.ltr,)),
    );
  }
}