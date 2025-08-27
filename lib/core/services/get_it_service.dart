import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:medtech_mobile/core/services/api_service.dart';
import 'package:medtech_mobile/features/ai%20chat/data/repo/ai_chat_repo_imp.dart';
import 'package:medtech_mobile/features/ai%20chat/domain/repos/ai_chat_repo.dart';
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
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwicm9sZSI6IlVTRVIiLCJpYXQiOjE3NTU1MzU2NDgsImV4cCI6MTc1NjE0MDQ0OH0.vRPnr5_iaNU2YH3MQdG4xjyg1pomcmsIeAv1DCdd1Qo",
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
  getIt.registerSingleton<AiChatRepo>(
    AiChatRepoImp(databaseService: getIt.get<DatabaseService>()),
  );
}
