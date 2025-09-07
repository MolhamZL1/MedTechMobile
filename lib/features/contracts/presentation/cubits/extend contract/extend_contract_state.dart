part of 'extend_contract_cubit.dart';

sealed class ExtendContractState extends Equatable {
  const ExtendContractState();

  @override
  List<Object> get props => [];
}

final class ExtendContractInitial extends ExtendContractState {}

final class ExtendContractSucsess extends ExtendContractState {}

final class ExtendContractLoading extends ExtendContractState {}

final class ExtendContractFailure extends ExtendContractState {
  final String errMessage;

  ExtendContractFailure({required this.errMessage});
}
