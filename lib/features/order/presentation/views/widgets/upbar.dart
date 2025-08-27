import 'package:flutter/material.dart';

class StatusChip extends StatelessWidget {
   String label;
   int count;
   bool selected;
   void Function() onTap;
   
   StatusChip({super.key, 
    required this.label,
    required this.count,
    this.selected = false,  required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text("$label  $count"),
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