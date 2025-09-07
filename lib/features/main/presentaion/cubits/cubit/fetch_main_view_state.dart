part of 'fetch_main_view_cubit.dart';

sealed class FetchMainViewState extends Equatable {
  const FetchMainViewState();

  @override
  List<Object> get props => [];
}

final class FetchMainViewInitial extends FetchMainViewState {}

final class FetchMainViewSucces extends FetchMainViewState {
  final MainViewEntity mainViewEntity;

  FetchMainViewSucces({required this.mainViewEntity});
}

final class FetchMainViewLoading extends FetchMainViewState {}

final class FetchMainViewFialure extends FetchMainViewState {
  final String errMessage;

  FetchMainViewFialure({required this.errMessage});
}
