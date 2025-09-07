part of 'request_maintainance_cubit.dart';

sealed class RequestMaintainanceState extends Equatable {
  const RequestMaintainanceState();

  @override
  List<Object> get props => [];
}

final class RequestMaintainanceInitial extends RequestMaintainanceState {}

final class RequestMaintainanceSuccess extends RequestMaintainanceState {}

final class RequestMaintainanceFailure extends RequestMaintainanceState {
  final String errMessage;

  RequestMaintainanceFailure({required this.errMessage});
}

final class RequestMaintainanceLoading extends RequestMaintainanceState {}
