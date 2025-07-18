part of 'verifycode_cubit.dart';

@immutable
sealed class VerifycodeState {}

final class VerifycodeInitial extends VerifycodeState {}

final class VerifycodeLoading extends VerifycodeState {}

final class VerifycodeSuccess extends VerifycodeState {}

final class VerifycodeError extends VerifycodeState {
  final String errMessage;
  VerifycodeError(this.errMessage);
}
