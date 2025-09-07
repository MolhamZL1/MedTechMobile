import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medtech_mobile/features/contracts/domain/repo/contracts_repo.dart';

part 'extend_contract_state.dart';

class ExtendContractCubit extends Cubit<ExtendContractState> {
  ExtendContractCubit(this.contractsRepo) : super(ExtendContractInitial());
  final ContractsRepo contractsRepo;
  extendContract({required String id, required String newEndDate}) async {
    emit(ExtendContractLoading());
    log(newEndDate);
    var result = await contractsRepo.extendContract(
      id: id,
      newEndDate: newEndDate,
    );
    result.fold(
      (l) => ExtendContractFailure(errMessage: l.errMessage),
      (r) => emit(ExtendContractSucsess()),
    );
  }
}
