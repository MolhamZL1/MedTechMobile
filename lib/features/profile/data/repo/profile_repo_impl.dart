// profile/data/repo/profile_repo_impl.dart
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medtech_mobile/features/profile/domain/entites/profile_entity.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/services/database_service.dart';
import '../../../../core/utils/backend_endpoints.dart';
import '../../domain/repo/profile_repo.dart';
import '../model/profile_model.dart';

class ProfileRepoImpl extends ProfileRepo {
  final DatabaseService databaseService;

  ProfileRepoImpl({required this.databaseService});

  @override
  Future<Either<Failure, ProfileEntity>> getProfile() async {
    try {
      final data = await databaseService.getData(
        endpoint: BackendEndpoints.profile,
      );
      final profile = ProfileModel.fromJson(data).toEntity();
      return right(profile);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
