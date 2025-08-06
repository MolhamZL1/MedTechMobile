import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/services/get_it_service.dart';
import 'package:medtech_mobile/core/widgets/CustomLoadingCircle.dart';
import 'package:medtech_mobile/features/products/domain/repo/products_repo.dart';
import 'package:medtech_mobile/features/products/presentation/cubits/cubit/products_cubit.dart';

import '../../../../core/widgets/show_err_dialog.dart';
import '../../../cart/domain/repos/cart_repo.dart';
import '../../../cart/presentation/cubits/update_cart/update_cart_cubit.dart';
import 'widgets/products_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(getIt.get<ProductsRepo>()),

      child: ProductsViewBody(),
    );
  }
}
