import 'package:bloc/bloc.dart';
import 'package:medtech_mobile/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'resetpassword_state.dart';

class ResetpasswordCubit extends Cubit<ResetpasswordState> {
  ResetpasswordCubit(this.authRepo) : super(ResetpasswordInitial());
  final AuthRepo authRepo;

  Future<void> resetpassword({
    required String email,
    required String code,
    required String newpassword,
  }) async {
    emit(ResetPasswordLoading());
    var result = await authRepo.resetpassword(
      email: email,
      code: code,
      newpassword: newpassword,
    );
    result.fold(
      (failure) => emit(ResetPasswordError(failure.errMessage)),
      (userEntity) => emit(ResetPasswordSuccess()),
    );
  }
}
