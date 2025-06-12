import 'package:flutter/material.dart';
import 'package:medtech_mobile/core/utils/app_text_styles.dart';

class Cutomtext extends StatelessWidget {
   Cutomtext({super.key,required this.text,this.stylee});
 final String? text;
 final TextStyle? stylee;
  @override
  Widget build(BuildContext context) {
    return  Padding(
     padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
                       padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.bottomLeft,
                        child:Text(
                          text ?? "",
                                style: stylee,
                        )
                      ),
    );
  }
}