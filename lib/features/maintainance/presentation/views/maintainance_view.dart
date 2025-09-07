import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/services/get_it_service.dart';
import 'package:medtech_mobile/features/maintainance/data/repo/maintianance_repo_imp.dart';
import 'package:medtech_mobile/features/maintainance/domain/repo/miantainance_repo.dart';

import '../cubits/cubit/request_maintainance_cubit.dart';
import 'widgets/MaintainanceViewBody.dart';

class MaintainanceView extends StatelessWidget {
  const MaintainanceView({super.key, required this.productId});
  static const routeName = "/Maintainance-view";
  final String productId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Maintainance')),
      body: BlocProvider(
        create:
            (context) =>
                RequestMaintainanceCubit(getIt.get<MiantainanceRepo>()),
        child: MaintainanceViewBody(productId: productId),
      ),
    );
  }
}
