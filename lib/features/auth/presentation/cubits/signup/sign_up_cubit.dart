import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/repos/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;

  void signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignUpLoading());
    var result = await authRepo.signUpUsingEmailAndPasswordwithverifycode(
      name: name,
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(SignUpError(errMessage: failure.errMessage)),
      (userEntity) {
        emit(SignUpSuccess());
      },
    );
  }
}
