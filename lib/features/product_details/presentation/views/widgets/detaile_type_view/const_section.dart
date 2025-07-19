import 'package:flutter/material.dart';

class ConstSection extends StatelessWidget {
  const ConstSection({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Column(
                    
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Need Assistance?",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600
                          ,color:  Theme.of(context).textTheme.bodyLarge?.color,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Our medical equipment specialists are here to help",
                          style: TextStyle(fontSize: 15,
                         color:  Theme.of(context).textTheme.bodySmall?.color,),
                        ),
                        const SizedBox(height: 16),
                              
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                            
                              },
                              icon: Icon(Icons.phone),
                              label: Text("Call Support"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                foregroundColor: Colors.white,
                              ),
                            ),
                            OutlinedButton.icon(
                              onPressed: () {
                           
                              },
                              icon: Icon(Icons.chat_bubble_outline),
                              label: Text("Live Chat"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
  }
}