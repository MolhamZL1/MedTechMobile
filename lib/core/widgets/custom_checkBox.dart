import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.title,
    required this.onChanged,
    this.value = false,
  });
  final String title;
  final void Function(bool?) onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          side: BorderSide(color: Colors.grey),
        ),
        Text(title),
      ],
    );
  }
}
