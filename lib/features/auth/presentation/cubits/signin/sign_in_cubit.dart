import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:medtech_mobile/features/auth/data/models/user_model.dart';
import 'package:medtech_mobile/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

import '../../../../../core/services/local_storage_service.dart';

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
      (userEntity) async {
        log(userEntity.token);
        await LocalStorageService.setItem(
          LocalStorageKeys.user,
          jsonEncode(UserModel.fromEntity(userEntity).toJson()),
        );
        await LocalStorageService.setItem(
          LocalStorageKeys.token,
          userEntity.token,
        );
        emit(SignInSuccess());
      },
    );
  }

  Future<void> signout() async {
    await LocalStorageService.clear();
  }
}
