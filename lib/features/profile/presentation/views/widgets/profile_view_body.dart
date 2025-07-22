import 'package:flutter/material.dart';
import 'package:medtech_mobile/core/utils/app_colors.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/text1.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/Profilestate.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/Text12.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/dcinfo.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/doctornamwtext.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/helpcolumn/helpcolumns.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/logoutbutton.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/profilecolumn/editprofilecard.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/email.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/profilecolumn/favoritecard.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/profilecolumn/paymentcard.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/profilecolumn/profilecardscolumns.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/profilepicture.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/profilecolumn/sitecard.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/settingcolumn/settingcardscolumns.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/text1.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/text13.dart';


class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return 
 Padding(
   padding: const EdgeInsets.all(8.0),
   child: Container(
     color: Colors.grey.shade100,
     child: SingleChildScrollView(
       child: Column(
        children: [
           Dcinfo(),
           Text11(),
            Profilecardscolumns(),
           Text12(),
           Settingcardscolumns(),
           Text13(),
           Helpcolumns(),
           SizedBox(height: 25,),
           Logoutbutton(),
           
        ],
       ),
     )
   ),
 );
    
  }
}
