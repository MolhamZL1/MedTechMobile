import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/services/get_it_service.dart';
import 'package:medtech_mobile/features/contracts/data/repo/contract_repo_imp.dart';
import 'package:medtech_mobile/features/contracts/presentation/cubits/get%20contracts/get_contract_cubit.dart';
import 'package:medtech_mobile/features/contracts/presentation/views/widgets/ContractsViewBody.dart';

import '../../domain/repo/contracts_repo.dart';

class ContractsView extends StatelessWidget {
  const ContractsView({super.key});
  static const routeName = "/contracts";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              GetContractCubit(getIt.get<ContractsRepo>())..getContract(),
      child: Scaffold(
        appBar: AppBar(title: Text('Contracts')),
        body: ContractsViewBody(),
      ),
    );
  }
}
