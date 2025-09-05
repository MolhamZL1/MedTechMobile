import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medtech_mobile/core/errors/failures.dart';
import 'package:medtech_mobile/core/services/database_service.dart';
import 'package:medtech_mobile/core/utils/backend_endpoints.dart';
import 'package:medtech_mobile/features/favorites/domain/repo/favorite_repo.dart';

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
}
