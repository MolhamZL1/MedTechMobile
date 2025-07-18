import 'package:bloc/bloc.dart';
import 'package:medtech_mobile/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'verifycode_state.dart';

class VerifycodeCubit extends Cubit<VerifycodeState> {
  VerifycodeCubit(this.authRepo) : super(VerifycodeInitial());
  final AuthRepo authRepo;

  Future<void> verifyCode({required String code, required String email}) async {
    emit(VerifycodeLoading());
    final result = await authRepo.verifySignUpCode(code: code, email: email);
    result.fold(
      (failure) => emit(VerifycodeError(failure.errMessage)),
      (user) => emit(VerifycodeSuccess()),
    );
  }
}
