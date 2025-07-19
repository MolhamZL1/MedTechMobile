import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/detaile_type_view/Rental_Widget.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/detaile_type_view/const_section.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/detaile_type_view/dettailes_type.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/detaile_type_view/overview_widget.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/detaile_type_view/safety-widget.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/detaile_type_view/specifications_widget.dart';


class DetalsTypeList extends StatefulWidget {
  const DetalsTypeList({super.key});

  @override
  State<DetalsTypeList> createState() => _DetalsTypeListState();
}

class _DetalsTypeListState extends State<DetalsTypeList> {
  int selectedIndex = 0;

  final List<String> categories = [
    'Overview',
    'Specifications',
    'Safety',
    'Rental',
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              height:40,
              color:  Theme.of(context).cardColor,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: DettailesType(
                    text: categories[index],
                    selected: selectedIndex == index,
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(width: 10),
                itemCount: categories.length,
              ),
            ),
          ),
          SizedBox(
            height: 400,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  buildDetailsContent(),

                  SizedBox(height: 10,),
                ConstSection(), 
      
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDetailsContent() {
    switch (selectedIndex) {
      case 0:
        return OverviewWidget();
      case 1:
        return SpecificationsWidget();
      case 2:
        return SafetyWidget();
      case 3:
        return RentalWidget();
      default:
        return SizedBox();
    }
  }
}
