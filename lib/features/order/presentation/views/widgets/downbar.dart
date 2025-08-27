import 'package:flutter/material.dart';

class IconChip extends StatelessWidget {
   IconData icon;
   String label;
   bool selected;
   void Function() onTap;

   IconChip({
    required this.icon,
    required this.label,
    this.selected = false,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      avatar: Icon(
        icon,
        size: 18,
        color: selected ? Colors.white : Colors.grey,
      ),
      label: Text(label),
      selected: selected,
      onSelected: (_) {onTap();},
      showCheckmark: false,
      selectedColor: Colors.blue,
      labelStyle: TextStyle(
        color: selected ? Colors.white : Colors.black,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}