import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/profile/editprofile/customtextfield.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/pagescards/profile/editprofile/picturesection.dart';

class Locationsection extends StatelessWidget {
   TextEditingController locationcontroller =TextEditingController();
   Locationsection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Column(
        children: [
        
                 Customtextfield(text: "العنوان",
                  icon: Icons.location_on_outlined,
                  controller: locationcontroller,
                   title: "دمشق  - المزة "),
        ],
      ),
    );
  }
}