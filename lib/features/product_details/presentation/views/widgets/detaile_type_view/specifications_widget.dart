import 'package:flutter/material.dart';

class SpecificationsWidget extends StatelessWidget {
  const SpecificationsWidget({super.key});

  final List<Map<String, String>> specs = const [
    {"title": "Field Strength", "value": "3.0 Tesla"},
    {"title": "Bore Diameter", "value": "70 cm"},
    {"title": "Patient Weight Limit", "value": "250 kg"},
    {"title": "Gradient Strength", "value": "45 mT/m"},
    {"title": "Slew Rate", "value": "200 T/m/s"},
    {"title": "RF Channels", "value": "32 channels"},
    {"title": "Acquisition Time", "value": "15–45 minutes"},
    {"title": "Power Requirements", "value": "400V, 3-phase"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Technical Specifications",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
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
                  Text(item['title']!, style: TextStyle(fontSize: 15,
                color:  Theme.of(context).textTheme.bodySmall?.color,
                  )),
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
              const Divider(height: 20,),
            ],
          ),
        )
      ],
    );
  }
}
