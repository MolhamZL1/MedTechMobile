import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medtech_mobile/core/errors/failures.dart';
import 'package:medtech_mobile/core/services/database_service.dart';
import 'package:medtech_mobile/core/utils/backend_endpoints.dart';
import 'package:medtech_mobile/features/main/domain/entity/main_view_entity.dart';
import 'package:medtech_mobile/features/main/domain/repo/main_view_repo.dart';

import '../models/main_view_model.dart';

class MainViewRepoImp implements MainViewRepo {
  final DatabaseService databaseService;

  MainViewRepoImp({required this.databaseService});
  @override
  Future<Either<Failure, MainViewEntity>> getMainView() async {
    try {
      var data = await databaseService.getData(
        endpoint: BackendEndpoints.getMainView,
      );

      return right(MainViewModel.fromJson(data).toEntity());
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
