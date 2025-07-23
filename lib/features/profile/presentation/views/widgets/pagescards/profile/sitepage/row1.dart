import 'package:flutter/material.dart';

class Row1 extends StatelessWidget {
  const Row1({super.key});

  @override
  Widget build(BuildContext context) {
    return       Row(
      
                children: [
                  Icon(Icons.home,color: Colors.green,),
                  SizedBox(width: 6),
                  Text("المنزل "),
                  Spacer(),
                     GestureDetector(
             onTap: () {},
            child: Container(
              width: 35,
              height: 35,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child:  Icon(
                Icons.payment,
                color: Colors.blue,
                 size: 19,
              ),
              
            ),
          ),
             SizedBox(width: 4,),
                GestureDetector(
             onTap: () {},
            child: Container(
              width: 35,
              height: 35,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child:  Icon(
                Icons.delete_outline,
                color: Colors.red,
                size: 19,
              ),
            ),
          ),
                ],
              );
  }
}