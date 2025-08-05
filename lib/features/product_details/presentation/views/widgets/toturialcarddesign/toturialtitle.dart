import 'package:flutter/material.dart';

class Toturialtitle extends StatelessWidget {
  const Toturialtitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),

      child: Align(
        alignment: Alignment.centerLeft,

        child: Text(title, textDirection: TextDirection.ltr),
      ),
    );
  }
}
