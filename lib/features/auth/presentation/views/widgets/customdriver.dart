import 'package:flutter/material.dart';

class CustomOrDivider extends StatelessWidget {
  final String text;
  const CustomOrDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Row(
        children: [
          Flexible(child: Divider(color: Colors.black, thickness: .7)),
          SizedBox(width: 5),
          Text(text, style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(width: 5),
          Flexible(child: Divider(color: Colors.black, thickness: .7)),
        ],
      ),
    );
  }
}
