import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medtech_mobile/features/maintainance/domain/repo/miantainance_repo.dart';

part 'request_maintainance_state.dart';

class RequestMaintainanceCubit extends Cubit<RequestMaintainanceState> {
  RequestMaintainanceCubit(this.miantainanceRepo)
    : super(RequestMaintainanceInitial());
  final MiantainanceRepo miantainanceRepo;
  requestMaintainance({
    required String id,
    required String issue,
    required String date,
  }) async {
    emit(RequestMaintainanceLoading());
    var result = await miantainanceRepo.requestMaintainance(
      id: id,
      issue: issue,
      date: date,
    );
    result.fold(
      (l) => emit(RequestMaintainanceFailure(errMessage: l.errMessage)),
      (r) => emit(RequestMaintainanceSuccess()),
    );
  }
}
