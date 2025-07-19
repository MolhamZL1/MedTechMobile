import 'package:flutter/material.dart';

class OverviewWidget extends StatelessWidget {
  const OverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Text(
            "Description",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
             color:  Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),

          const SizedBox(height: 8),

          
          Text(
            "State-of-the-art 3T MRI scanner with advanced imaging capabilities. "
            "Perfect for detailed diagnostic imaging with exceptional image quality "
            "and patient comfort features.",
            style: TextStyle(fontSize: 15,
           color:  Theme.of(context).textTheme.bodySmall?.color,),
          ),

          const SizedBox(height: 35),

        
          Text(
            "Key Features",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color:  Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),

          const SizedBox(height: 8),
          ...[
            "Advanced noise reduction technology",
            "Patient communication system",
            "Emergency stop functionality",
            "Automated patient positioning",
            "Real-time image reconstruction",
            "Multi-parametric imaging",
            "Cardiac and neurological protocols",
            "24/7 technical support included",
          ].map(
            (feature) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 22),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      feature,
                      style: TextStyle(fontSize: 15,
                     color:  Theme.of(context).textTheme.bodySmall?.color,),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 30),

     
        ],
      ),
    );
  }
}
