import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/help/help&support/help&supportpage.dart';

class Helpcard extends StatelessWidget {
  const Helpcard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => Helpandsupportpage(), 
  ),
);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(
                    0.1,
                  ), 
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.help_outlined, // غير الأيقونة حسب اللي بدك ياه
                    color: Colors.green, // لون الأيقونة
                    size: 24,
                  ),
                ),
              ),
      
              SizedBox(width: 10),
              Text(" الدعم والمساعدة "),
                  const Spacer(),
              IconButton(onPressed: () {  },
              icon: Icon(Icons.arrow_drop_down),
              ),
            ],
          ),
        ),
      ),
    );
  }
}