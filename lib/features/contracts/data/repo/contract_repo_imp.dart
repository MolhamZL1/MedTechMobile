import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medtech_mobile/core/errors/failures.dart';
import 'package:medtech_mobile/core/services/database_service.dart';
import 'package:medtech_mobile/core/utils/backend_endpoints.dart';
import 'package:medtech_mobile/features/contracts/data/models/contract_model.dart';
import 'package:medtech_mobile/features/contracts/domain/entity/contract_entity.dart';
import 'package:medtech_mobile/features/contracts/domain/repo/contracts_repo.dart';

class ContractRepoImp implements ContractsRepo {
  final DatabaseService databaseService;

  ContractRepoImp({required this.databaseService});
  @override
  Future<Either<Failure, void>> extendContract({
    required String id,
    required String newEndDate,
  }) async {
    try {
      await databaseService.addData(
        endpoint: BackendEndpoints.extendContract,
        rowid: id,
        data: {"newEndDate": newEndDate},
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
  Future<Either<Failure, List<ContractEntity>>> getContracts() async {
    try {
      var data = await databaseService.getData(
        endpoint: BackendEndpoints.getContracts,
      );
      List<ContractEntity> contracts = List<ContractEntity>.from(
        data.map((e) => ContractModel.fromJson(e).toEntity()),
      );
      return right(contracts);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
