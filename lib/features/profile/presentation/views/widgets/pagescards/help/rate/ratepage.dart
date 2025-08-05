import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/help/rate/deliverycard.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/help/rate/geniralrate.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/help/rate/maincard.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/help/rate/productqualitycard.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/help/rate/servicesratecard.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/help/rate/useratecard.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/profile/editprofile/editprofileappbar.dart';

class Ratepage extends StatelessWidget {
  const Ratepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'تقييم التطبيق',icon: Icons.star, color1: Colors.orange,),
       body: Container(color: Colors.grey.shade100,
         child: SingleChildScrollView(child: 
           Padding(padding: EdgeInsets.all(4),
           child: Column(
            children: [
              Maincard(),
              SizedBox(height: 9,),
              Geniralrate(),
              Useratecard(),
              Productqualitycard(),
              Servicesratecard(),
              Deliverycard()
            ],
           ),
           )
         ,),
),
    );
  }
}