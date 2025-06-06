import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medtech_mobile/core/utils/app_colors.dart';

class Customdriver extends StatelessWidget {
  @required String text;
   Customdriver({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return    Padding(
                    padding:  EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        Flexible(
                            child: Divider(
                             color: AppColors.blackColor ,
                              thickness: 1,
                            )),
                            SizedBox(width: 5,),
                        Text(
                         text ,
                          style: TextStyle(
                                    color: AppColors.blackColor ,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                         SizedBox(width: 5,),
                        Flexible(
                            child: Divider(
                                 color: AppColors.blackColor ,
                              thickness: 1,
                            )),
                      ],
                    ),
                  );
  }
}