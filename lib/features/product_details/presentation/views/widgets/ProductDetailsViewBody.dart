import 'package:flutter/material.dart';
import 'package:medtech_mobile/core/utils/app_colors.dart';
import 'package:medtech_mobile/core/widgets/CustomImageNetwork.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/detaile_type_view/detals_type_list.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/optionbuttonsection.dart';
import 'package:medtech_mobile/features/product_details/presentation/views/widgets/pricesection.dart';

import 'package:medtech_mobile/features/products/domain/entities/product_entitie.dart';

import 'detaile_type_view/const_section.dart';
import 'ratingsection.dart';
import 'totuialssection.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.productEntitie});
  final ProductEntity productEntitie;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Ratingsection(),
          const SizedBox(height: 8),
          SizedBox(
            height: MediaQuery.of(context).size.height * .4,
            child: Hero(
              tag: productEntitie.id,
              child: InteractiveViewer(
                maxScale: 5,
                minScale: 1,
                child: CustomImageNetwork(
                  imageUrl:
                      productEntitie.imagesUrl.isEmpty
                          ? ""
                          : productEntitie.imagesUrl[0],
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              productEntitie.nameEn,
              maxLines: 2,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),

          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              "Choose Option",
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: AppColors.primary),
            ),
          ),
          Optionbuttonsection(),
          Pricesection(productEntity: productEntitie),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "Description",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              productEntitie.descriptionEn,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          SizedBox(height: 16),
          Visibility(
            visible: productEntitie.vedios.isNotEmpty,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Totuials",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Totuialssection(vedioEntitys: productEntitie.vedios),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          ConstSection(),
          SizedBox(height: 16),

          // DetalsTypeList(),
        ],
      ),
    );
  }
}
