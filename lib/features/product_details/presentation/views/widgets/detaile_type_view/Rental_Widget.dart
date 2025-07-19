import 'package:flutter/material.dart';

class RentalWidget extends StatelessWidget {
  const RentalWidget({super.key});

  final List<Map<String, String>> specs = const [
    {"title": "Min rental", "value": "1 day"},
    {"title": "Min rental", "value": "30 day"},
    {"title": "Deposite", "value": "\$ 5000"},
    {"title": "incurance", "value": "requied"},
    {"title": "Deliviery", "value": "free whithin 50m"},
    {"title": "setup", "value": "32 channels"},
    {"title": "Training", "value": "4 hours"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Rental Terms ",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
          color:  Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
        const SizedBox(height: 16),
        ...specs.map(
          (item) => Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item['title']!,
                   style: TextStyle(fontSize: 15, 
                 color:  Theme.of(context).textTheme.bodySmall?.color,)),
                  Text(
                    item['value']!,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                     color:  Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                ],
              ),
              const Divider(height: 20),
            ],
          ),
        )
      ],
    );
  }
}
