import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/profile/editprofile/editprofile.dart';

class Editprofilecard extends StatelessWidget {
  const Editprofilecard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
  Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => Editprofile(), 
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
                  color: Colors.blue.withOpacity(
                    0.1,
                  ), 
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.message, 
                    color: Colors.blue, 
                    size: 24,
                  ),
                ),
              ),
      
              SizedBox(width: 10),
              Text("تعديل الملف الشخصي "),
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
