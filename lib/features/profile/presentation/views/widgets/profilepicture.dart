import 'package:flutter/material.dart';

class Profilepicture extends StatelessWidget {
 IconData? icon;
 //String text;
   Profilepicture({super.key,required this.icon,});
    
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue.shade100,
              backgroundImage: AssetImage('assets/images/profile.jpg'), 
            ),
      
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child:  Icon(
                  icon,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),
            //  SizedBox(height: 6,),
            //    Text(text),

          ],
        ),
       
      ),
      
    );
    
  }
}
