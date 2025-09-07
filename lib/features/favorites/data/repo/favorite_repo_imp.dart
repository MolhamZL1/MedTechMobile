import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medtech_mobile/core/errors/failures.dart';
import 'package:medtech_mobile/core/services/database_service.dart';
import 'package:medtech_mobile/core/utils/backend_endpoints.dart';
import 'package:medtech_mobile/features/favorites/domain/repo/favorite_repo.dart';

import '../../../products/data/models/product_model.dart';
import '../../../products/domain/entities/product_entitie.dart';

class FavoriteRepoImp implements FavoriteRepo {
  final DatabaseService databaseService;

  FavoriteRepoImp({required this.databaseService});
  @override
  Future<Either<Failure, void>> addToFavorite({required String id}) async {
    try {
      await databaseService.addData(
        endpoint: "${BackendEndpoints.addToFavorite}/$id",
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
  Future<Either<Failure, List<ProductEntity>>> getFavorites() async {
    try {
      var data = await databaseService.getData(
        endpoint: BackendEndpoints.getFavorites,
      );

      List<ProductEntity> products = List<ProductEntity>.from(
        data["favorites"].map((e) => ProductModel.fromJson(e).toEntity()),
      );
      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
