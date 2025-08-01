import 'package:flutter/material.dart';

class Helptext extends StatelessWidget {
  const Helptext({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Align(alignment: Alignment.centerRight,
            child: Text(
              "تواصل معنا ",
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.end,
            ),
          ),
        );
  }
}