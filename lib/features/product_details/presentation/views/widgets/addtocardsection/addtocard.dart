import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/addtocardsection/addtocartbutton.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/addtocardsection/pricecolumn.dart';

class Addtocardsec extends StatelessWidget {
  const Addtocardsec({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
      color: Theme.of(context).scaffoldBackgroundColor,

  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.2), // لون الظل
      offset: Offset(0, -2), // ⬅️ ظل للأعلى
      blurRadius: 6,
      spreadRadius: 0,
    ),
  ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Expanded(child: Addtocartbutton()),
         SizedBox(width: 4),
          Expanded(child: Pricecolumn())],
      ),
    );
  }
}
