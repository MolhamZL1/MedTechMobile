import 'package:flutter/material.dart';

class Settingcard extends StatelessWidget {
  const Settingcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blueGrey.withOpacity(
                  0.1,
                ), 
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.settings, 
                  color: Colors.blueGrey,
                  size: 24,
                )
              ),
            ),

            SizedBox(width: 10),
            Text("الاعدادات العامة "),
       const Spacer(),
            IconButton(onPressed: () {  },
            icon: Icon(Icons.arrow_drop_down),
            ),
          ],
        ),
      ),
    );
  }
}