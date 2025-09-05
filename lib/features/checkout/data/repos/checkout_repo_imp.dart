import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:medtech_mobile/core/errors/failures.dart';
import 'package:medtech_mobile/core/services/database_service.dart';
import 'package:medtech_mobile/core/utils/backend_endpoints.dart';

import 'package:medtech_mobile/features/checkout/data/model/rentedItemmodel.dart';

import '../../domain/repos/checkout_repo.dart';

class CheckoutRepoImp implements CheckoutRepo {
  final DatabaseService databaseService;

  CheckoutRepoImp({required this.databaseService});
  @override
  Future<Either<Failure, void>> checkout({
    required String address,
    required List<Renteditemmodel> rentedItems,
  }) async {
    try {
      final data = {
        "shippingAddress": address,
        "rentalDetails": rentedItems.map((e) => e.toJson()).toList(),
      };

      await databaseService.addData(
        endpoint: BackendEndpoints.createCheckout,
        data: data,
      );
      return Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
