import 'package:flutter/material.dart';

class customAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  IconData? icon;
  Color? color1;
   customAppBar({super.key,required this.title, this.icon,
   required this.color1,
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
            color: color1?.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.arrow_back,
            color: color1,
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
              color: color1?.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child:  Icon(
              icon,
              color: color1,
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
