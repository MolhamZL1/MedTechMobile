import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/help/help&support/calluscard.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/help/help&support/cancelordercard.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/help/help&support/commonquestiontext.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/help/help&support/directchat.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/help/help&support/emailcard.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/help/help&support/emergencecard.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/help/help&support/ensuredevice.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/help/help&support/helptext.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/help/help&support/orderaservicecard.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/help/help&support/paymentwaycard.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/help/help&support/rentaldevicecard.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/profile/editprofile/editprofileappbar.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/profilecolumn/paymentcard.dart';

class Helpandsupportpage extends StatelessWidget {
  const Helpandsupportpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'الدعم والمساعدة',icon: Icons.help_outline, ),
       body: Container(color: Colors.grey.shade100,
         child: SingleChildScrollView(child: 
           Padding(padding: EdgeInsets.all(4),
           child: Column(
            children: [
           
             Helptext(),
             Directchat(),
             Calluscard(),
             Emailcard(),
             Commonquestiontext(),
             Rentaldevicecard(),
            Ensuredevice(),
            Orderaservicecard(),
            Cancelordercard(),
            Paymentwaycard(),
            SizedBox(height: 11,),
             Emergencecard(),
            ],
           ),
           )
         ,),
),
    );
  }
}