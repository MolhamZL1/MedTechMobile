import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:medtech_mobile/core/services/api_service.dart';
import 'package:medtech_mobile/core/services/local_storage_service.dart';
import 'package:medtech_mobile/features/ai%20chat/data/repo/ai_chat_repo_imp.dart';
import 'package:medtech_mobile/features/ai%20chat/domain/repos/ai_chat_repo.dart';
import 'package:medtech_mobile/features/cart/data/repo/cart_repo_imp.dart';
import 'package:medtech_mobile/features/cart/domain/repos/cart_repo.dart';
import 'package:medtech_mobile/features/checkout/data/repos/checkout_repo_imp.dart';
import 'package:medtech_mobile/features/checkout/domain/repos/checkout_repo.dart';
import 'package:medtech_mobile/features/contracts/data/repo/contract_repo_imp.dart';
import 'package:medtech_mobile/features/contracts/domain/repo/contracts_repo.dart';
import 'package:medtech_mobile/features/favorites/domain/repo/favorite_repo.dart';
import 'package:medtech_mobile/features/main/data/repo/main_view_repo_imp.dart';
import 'package:medtech_mobile/features/main/domain/repo/main_view_repo.dart';
import 'package:medtech_mobile/features/maintainance/data/repo/maintianance_repo_imp.dart';
import 'package:medtech_mobile/features/maintainance/domain/repo/miantainance_repo.dart';
import 'package:medtech_mobile/features/order/data/repo/order_repo_impl.dart';
import 'package:medtech_mobile/features/order/domain/repos/order_repo.dart';
import 'package:medtech_mobile/features/products/data/repo/products_repo_imp.dart';
import 'package:medtech_mobile/features/products/domain/repo/products_repo.dart';
import 'package:medtech_mobile/features/profile/data/repo/profile_repo_impl.dart';
import 'package:medtech_mobile/features/profile/domain/repo/profile_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/repos/auth_repo_imp.dart';
import '../../features/auth/domain/repos/auth_repo.dart';
import '../../features/favorites/data/repo/favorite_repo_imp.dart';
import '../utils/backend_endpoints.dart';
import 'database_service.dart';
import 'user_data_service.dart';

final getIt = GetIt.instance;

setupSingltonGetIt() async {
  getIt.registerSingleton<DatabaseService>(ApiService());

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImp(databaseService: getIt.get<DatabaseService>()),
  );
  getIt.registerSingleton<ProfileRepo>(
    ProfileRepoImpl(databaseService: getIt.get<DatabaseService>()),
  );
  getIt.registerSingleton<CartRepo>(
    CartRepoImp(databaseService: getIt.get<DatabaseService>()),
  );
  getIt.registerSingleton<AiChatRepo>(
    AiChatRepoImp(databaseService: getIt.get<DatabaseService>()),
  );
  getIt.registerSingleton<FavoriteRepo>(
    FavoriteRepoImp(databaseService: getIt.get<DatabaseService>()),
  );
  getIt.registerSingleton<CheckoutRepo>(
    CheckoutRepoImp(databaseService: getIt.get<DatabaseService>()),
  );
  getIt.registerSingleton<OrderRepo>(
    OrderRepoImpl(databaseService: getIt.get<DatabaseService>()),
  );
  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImp(databaseService: getIt.get<DatabaseService>()),
  );
  getIt.registerSingleton<ContractsRepo>(
    ContractRepoImp(databaseService: getIt.get<DatabaseService>()),
  );
  getIt.registerSingleton<MiantainanceRepo>(
    MaintiananceRepoImp(databaseService: getIt.get<DatabaseService>()),
  );
  getIt.registerSingleton<MainViewRepo>(
    MainViewRepoImp(databaseService: getIt.get<DatabaseService>()),
  );
}
