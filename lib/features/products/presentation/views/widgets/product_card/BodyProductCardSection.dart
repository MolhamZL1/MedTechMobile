import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/services/get_it_service.dart';
import 'package:medtech_mobile/features/cart/domain/repos/cart_repo.dart';
import 'package:medtech_mobile/features/cart/presentation/cubits/update_cart/update_cart_cubit.dart';

import '../../../../domain/entities/product_entitie.dart';
import 'FooterProductCardSection.dart';
import 'RateProductCardSection.dart';

class BodyProductCardSection extends StatelessWidget {
  const BodyProductCardSection({super.key, required this.productEntitie});

  final ProductEntity productEntitie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productEntitie.categoryEn,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 4),
          Text(
            productEntitie.nameEn,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 4),
          RateProductCardSection(productEntitie: productEntitie),
          const SizedBox(height: 8),
          BlocProvider(
            create: (context) => UpdateCartCubit(getIt.get<CartRepo>()),
            child: FooterProductCardSection(productEntitie: productEntitie),
          ),
        ],
      ),
    );
  }
}
