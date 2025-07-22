import 'package:flutter/material.dart';

class Rolescard extends StatelessWidget {
  const Rolescard({super.key});

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
                color: Colors.grey.withOpacity(
                  0.1,
                ), 
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.note_alt, // غير الأيقونة حسب اللي بدك ياه
                  color: Colors.blueGrey, // لون الأيقونة
                  size: 24,
                ),
              ),
            ),

            SizedBox(width: 10),
            Text(" الشروط والاحكام "),
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