part of 'get_contract_cubit.dart';

sealed class GetContractState extends Equatable {
  const GetContractState();

  @override
  List<Object> get props => [];
}

final class GetContractInitial extends GetContractState {}

final class GetContractLoading extends GetContractState {}

final class GetContractSuccess extends GetContractState {
  final List<ContractEntity> contracts;

  GetContractSuccess({required this.contracts});
}

final class GetContractFailure extends GetContractState {
  final String errMessage;

  GetContractFailure({required this.errMessage});
}
