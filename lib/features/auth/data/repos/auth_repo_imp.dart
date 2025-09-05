import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medtech_mobile/core/errors/failures.dart';
import 'package:medtech_mobile/core/services/database_service.dart';
import 'package:medtech_mobile/core/services/get_it_service.dart';
import 'package:medtech_mobile/core/utils/backend_endpoints.dart';
import 'package:medtech_mobile/features/auth/data/models/user_model.dart';
import 'package:medtech_mobile/features/auth/domain/entities/user_entity.dart';
import 'package:medtech_mobile/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImp implements AuthRepo {
  final DatabaseService databaseService;

  AuthRepoImp({required this.databaseService});
  @override
  Future<Either<Failure, void>> signUpUsingEmailAndPasswordwithverifycode({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      await databaseService.addData(
        endpoint: BackendEndpoints.signUp,
        data: {"email": email, "password": password, "username": name},
      );
      return right(null);
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> verifySignUpCode({
    required String code,
    required String email,
  }) async {
    try {
      await databaseService.addData(
        endpoint: BackendEndpoints.verifySignUpCode,
        data: {"code": code, "email": email},
      );
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinUsingEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var data = await databaseService.addData(
        endpoint: BackendEndpoints.signIn,
        data: {"identifier": email, "password": password},
      );

      return right(UserModel.fromJson(data).toEntity());
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinUsingGoogle() {
    // TODO: implement signinUsingGoogle
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      Map<String, dynamic> data = await databaseService.addData(
        endpoint: BackendEndpoints.signIn,
        data: {},
      );
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  @override
  Future<Either<Failure, void>> forgetPassword({required String email}) async {
    try {
      await databaseService.addData(
        endpoint: BackendEndpoints.forgetPassword,
        data: {"email": email},
      );
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> resetpassword({
    required String email,
    required String code,
    required String newpassword,
  }) async {
    try {
      await databaseService.addData(
        endpoint: BackendEndpoints.resetPassword,
        data: {"email": email, "code": code, "newPassword": newpassword},
      );
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      Map<String, void> data = await databaseService.addData(
        endpoint: BackendEndpoints.changePassword,
        data: {"currentPassword": currentPassword, "newPassword": newPassword},
      );
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
