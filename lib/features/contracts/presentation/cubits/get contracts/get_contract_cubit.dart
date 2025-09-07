import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medtech_mobile/features/contracts/data/repo/contract_repo_imp.dart';
import 'package:medtech_mobile/features/contracts/domain/entity/contract_entity.dart';
import 'package:medtech_mobile/features/contracts/domain/repo/contracts_repo.dart';

part 'get_contract_state.dart';

class GetContractCubit extends Cubit<GetContractState> {
  GetContractCubit(this.contractsRepo) : super(GetContractInitial());
  final ContractsRepo contractsRepo;
  getContract() async {
    emit(GetContractLoading());
    var result = await contractsRepo.getContracts();
    result.fold(
      (l) => emit(GetContractFailure(errMessage: l.errMessage)),
      (r) => emit(GetContractSuccess(contracts: r)),
    );
  }
}
