import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/addtocardsection/addtocartbutton.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/addtocardsection/pricecolumn.dart';
import 'package:medtech_mobile/features/products/domain/entities/product_entitie.dart';

class Addtocardsec extends StatelessWidget {
  const Addtocardsec({super.key, required this.productEntity});
  final ProductEntity productEntity;

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
        children: [
          Expanded(child: Addtocartbutton(id: productEntity.id.toString())),
          SizedBox(width: 4),
          Expanded(child: Pricecolumn(productEntity: productEntity)),
        ],
      ),
    );
  }
}
