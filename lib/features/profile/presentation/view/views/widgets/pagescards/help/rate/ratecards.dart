import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/help/rate/starsrow.dart';

class Ratecards extends StatelessWidget {
  String text;
   Ratecards({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Text(text, style: Theme.of(context).textTheme.bodyLarge),
              Starsrow(),
            ],
          ),
        ),
      ),
    );
  }
}