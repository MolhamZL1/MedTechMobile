import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:medtech_mobile/core/services/api_service.dart';
import 'package:medtech_mobile/features/cart/data/repo/cart_repo_imp.dart';
import 'package:medtech_mobile/features/cart/domain/repos/cart_repo.dart';
import 'package:medtech_mobile/features/products/data/repo/products_repo_imp.dart';
import 'package:medtech_mobile/features/products/domain/repo/products_repo.dart';

import '../../features/auth/data/repos/auth_repo_imp.dart';
import '../../features/auth/domain/repos/auth_repo.dart';
import '../utils/backend_endpoints.dart';
import 'database_service.dart';
import 'user_data_service.dart';

final getIt = GetIt.instance;

void setupSingltonGetIt() {
  getIt.registerLazySingleton<UserService>(() => UserService());

  getIt.registerSingleton<DatabaseService>(
    ApiService(
      dio: Dio(
        BaseOptions(
          baseUrl: BackendEndpoints.url,
          headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJtb2xoYW1zYTQ5QGdtYWlsLmNvbSIsInJvbGUiOiJBRE1JTiIsImlhdCI6MTc1MzUyODg0OSwiZXhwIjoxNzU0MTMzNjQ5fQ.e5latSTB2QTT4avWcWqyfdaQHznAeC7GDwVRIuCnYSs",
          },
          // getIt<UserService>().user?.token != null
          //     ? {
          //     }
          //     : null,
        ),
      ),
    ),
  );

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImp(databaseService: getIt.get<DatabaseService>()),
  );
  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImp(databaseService: getIt.get<DatabaseService>()),
  );
  getIt.registerSingleton<CartRepo>(
    CartRepoImp(databaseService: getIt.get<DatabaseService>()),
  );
}
