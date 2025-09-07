import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medtech_mobile/core/errors/failures.dart';
import 'package:medtech_mobile/core/services/database_service.dart';
import 'package:medtech_mobile/features/maintainance/domain/repo/miantainance_repo.dart';

import '../../../../core/utils/backend_endpoints.dart';

class MaintiananceRepoImp implements MiantainanceRepo {
  final DatabaseService databaseService;

  MaintiananceRepoImp({required this.databaseService});
  @override
  Future<Either<Failure, void>> requestMaintainance({
    required String id,
    required String issue,
    required String date,
  }) async {
    try {
      await databaseService.addData(
        endpoint: BackendEndpoints.requestMaintainance,
        data: {
          "productId": id,
          "issueDescription": issue,
          "preferredServiceDate": date,
        },
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
