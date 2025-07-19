import 'package:flutter/material.dart';

class SafetyWidget extends StatelessWidget {
  const SafetyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
        children: [
             Text(
              
            "Safety Informtion ",
       
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            color:  Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),

          const SizedBox(height: 12),
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
                    Icon(Icons.warning, color: Colors.orange, size: 22),
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
      

         