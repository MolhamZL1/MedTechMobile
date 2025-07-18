import 'package:dartz/dartz.dart';
import 'package:medtech_mobile/core/errors/failures.dart';
import 'package:medtech_mobile/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> signUpUsingEmailAndPasswordwithverifycode({
    required String email,
    required String password,
    required String name,
  });
  Future<Either<Failure, void>> verifySignUpCode({
    required String code,
    required String email,
  });
  Future<Either<Failure, UserEntity>> signinUsingEmailAndPassword({
    required String email,
    required String password,
  }); ////
  Future<Either<Failure, dynamic>> forgetPassword({
    required String email,
  }); //send code
  Future<Either<Failure, dynamic>> resetpassword({
    required String email,
    required String code,
    required String newpassword,
  });
  ////
  Future<Either<Failure, dynamic>> changePassword({
    required String currentPassword,
    required String newPassword,
  });

  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, UserEntity>> signinUsingGoogle();
}
