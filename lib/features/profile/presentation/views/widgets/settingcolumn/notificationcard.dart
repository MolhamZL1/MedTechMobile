import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/setting/notifications/notificationpage.dart';

class Notificationcard extends StatelessWidget {
  const Notificationcard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap: () {
         Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) =>Notificationpage (), 
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
                  color: Colors.purple.withOpacity(
                    0.1,
                  ), 
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.notifications, // غير الأيقونة حسب اللي بدك ياه
                    color: Colors.purple, // لون الأيقونة
                    size: 24,
                  ),
                ),
              ),
      
              SizedBox(width: 10),
              Text("الاشعارات "),
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