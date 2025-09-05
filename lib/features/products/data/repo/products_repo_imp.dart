import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:medtech_mobile/core/errors/failures.dart';

import 'package:medtech_mobile/features/products/domain/entities/product_entitie.dart';

import '../../../../core/services/database_service.dart';
import '../../../../core/utils/backend_endpoints.dart';
import '../../domain/repo/products_repo.dart';
import '../models/product_model.dart';

class ProductsRepoImp extends ProductsRepo {
  final DatabaseService databaseService;
  ProductsRepoImp({required this.databaseService});
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts({
    required String category,
  }) async {
    try {
      var data = await databaseService.getData(
        endpoint: BackendEndpoints.getProducts,
        quary: {"withVideos": true, "category": category},
      );
      List<ProductEntity> products = List<ProductEntity>.from(
        data["products"].map((e) => ProductModel.fromJson(e).toEntity()),
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
