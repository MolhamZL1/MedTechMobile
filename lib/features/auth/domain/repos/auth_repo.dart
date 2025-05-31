import 'package:dartz/dartz.dart';
import 'package:medtech_mobile/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> signUpUsingEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });
  Future<Either<Failure, UserEntity>> signinUsingEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<Failure, UserEntity>> signinUsingGoogle();
}
