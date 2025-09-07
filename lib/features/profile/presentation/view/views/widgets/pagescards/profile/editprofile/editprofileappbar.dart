import 'package:flutter/material.dart';

class customAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  IconData? icon;

   customAppBar({super.key,required this.title, this.icon,

   });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
        ),
      ),
      title:  Text(
       title,
        style: TextStyle(fontSize: 15),
      ),
      actions: [
        GestureDetector(
           onTap: () {},
          child: Container(
            width: 70,
            height: 70,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child:  Icon(
              icon,
              color: Colors.blue,
           size: 24,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
