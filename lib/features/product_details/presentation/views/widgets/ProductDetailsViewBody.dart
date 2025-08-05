import 'package:flutter/material.dart';
import 'package:medtech_mobile/core/widgets/CustomImageNetwork.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/addtocardsection/addtocard.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/detaile_type_view/detals_type_list.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/optionbuttonsection.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/pricesection.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/productnamewidget.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/text1.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/text2.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/text3.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/totuialssection.dart';
import 'package:medtech_mobile/features/products/domain/entities/prodetailes_entites.dart';
import 'package:medtech_mobile/features/products/domain/entities/product_entitie.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.productEntitie});
  final ProductEntity productEntitie;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .4,
            child: Hero(
              tag: productEntitie.id,
              child: InteractiveViewer(
                maxScale: 5,
                minScale: 1,
                child: CustomImageNetwork(
                  imageUrl: productEntitie.imagesUrl[0],
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Productnamewidget(),
          Text1(),
          Text2(),
          SizedBox(height: 10),
          Text3(),
          Optionbuttonsection(),
          Pricesection(),
          Totuialssection(),

          DetalsTypeList(),
        ],
      ),
    );
  }
}
