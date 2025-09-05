import 'package:flutter/material.dart';

class Emergencecard extends StatelessWidget {
  const Emergencecard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
             width: double.infinity,
       decoration: BoxDecoration(
         border: Border.all(
      color: Colors.red, 
      width: 1,        
    ),

        color: const Color.fromARGB(255, 255, 225, 223),
        borderRadius: BorderRadius.circular(10),
        
       ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children:  [
              Text(
                ' الدعم الطارئ ',
                style: TextStyle(fontWeight: FontWeight.bold,
                color: Colors.red),
              ),
              SizedBox(height: 4),
              Text(
       'للحالات الطارئة المتعلقة بالأجهزة الطبية الحيوية',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12, color: const Color.fromARGB(255, 152, 43, 36)),
              ),
                  SizedBox(height: 8),
              MaterialButton(onPressed: (){},
              child: Container(
                width: double.infinity,
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                   color: Colors.red,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone,color: Colors.white,),
                    SizedBox(width: 3,),
                    Text('اتصال طارئ ',style: TextStyle(color: Colors.white),),
                  ],
                                ),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}