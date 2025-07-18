import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:medtech_mobile/core/services/api_service.dart';

import '../../features/auth/data/repos/auth_repo_imp.dart';
import '../../features/auth/domain/repos/auth_repo.dart';
import 'database_service.dart';

final getIt = GetIt.instance;

void setupSingltonGetIt() {
  getIt.registerSingleton<DatabaseService>(
    ApiService(dio: Dio(BaseOptions(baseUrl: "http://localhost:8383/api/"))),
  );

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImp(databaseService: getIt.get<DatabaseService>()),
  );
}
