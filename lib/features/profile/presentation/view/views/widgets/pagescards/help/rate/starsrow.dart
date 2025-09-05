import 'package:flutter/material.dart';

class Starsrow extends StatefulWidget {
  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<Starsrow> {
  List<bool> isSelected = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  isSelected[index] = !isSelected[index];
                });
              },
              icon: Icon(
                isSelected[index] ? Icons.star : Icons.star_border_outlined,
                color: isSelected[index] ? Colors.orange : null,
              ),
            ),
            if (index != 4) SizedBox(width: 4),
          ],
        );
      }),
    );
  }
}
