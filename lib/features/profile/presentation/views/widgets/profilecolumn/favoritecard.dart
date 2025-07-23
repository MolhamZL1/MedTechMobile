import 'package:flutter/material.dart';

class Favoritecard extends StatelessWidget {
  const Favoritecard({super.key});

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
                color: Colors.red.withOpacity(
                  0.1,
                ), 
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.favorite_border, // غير الأيقونة حسب اللي بدك ياه
                  color: Colors.red, // لون الأيقونة
                  size: 24,
                ),
              ),
            ),

            SizedBox(width: 10),
            Text(" المنتجات المفضلة "),
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
