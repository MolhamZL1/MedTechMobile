import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/order/domain/entities/card_order_model.dart';
import 'package:medtech_mobile/features/order/domain/entities/order_entities.dart';
import 'package:medtech_mobile/features/order/presentation/views/customcard.dart';
import 'package:medtech_mobile/features/order/presentation/views/widgets/downbar.dart';
import 'package:medtech_mobile/features/order/presentation/views/widgets/downbar_body.dart';
import 'package:medtech_mobile/features/order/presentation/views/widgets/ordercard.dart';
import 'package:medtech_mobile/features/order/presentation/views/widgets/upbar.dart';
import 'package:medtech_mobile/features/order/presentation/views/widgets/upbar_body.dart';
import 'package:medtech_mobile/features/profile/presentation/views/widgets/pagescards/profile/editprofile/editprofileappbar.dart';

class OrderViewBody extends StatefulWidget {
  const OrderViewBody({super.key});

  @override
  State<OrderViewBody> createState() => _OrderViewBodyState();
}

class _OrderViewBodyState extends State<OrderViewBody> {
   
 int selectedStatus = 0;

  void onStatusChanged(int status) {
    setState(() {
      selectedStatus = status;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "الطلبات ",
      icon: Icons.filter_list,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الشريط الأول
            UpbarBody(    selectedStatus: selectedStatus,
          onStatusChanged: onStatusChanged,),
            SizedBox(height: 12),
            // الشريط الثاني
           DownbarBody(),
       
            Customcard(selectedStatus: selectedStatus,),
        
          ],
        ),

      ),
    );
  }
}