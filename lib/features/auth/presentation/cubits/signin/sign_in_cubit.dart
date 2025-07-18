import 'package:bloc/bloc.dart';
import 'package:medtech_mobile/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());
  final AuthRepo authRepo;

  void signIn({required String email, required String password}) async {
    emit(SignInLoading());
    var result = await authRepo.signinUsingEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(SignInError(errMessage: failure.errMessage)),
      (userEntity) {
        emit(SignInSuccess());
      },
    );
  }
}
