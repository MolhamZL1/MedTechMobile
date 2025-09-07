import 'package:dartz/dartz.dart';
import 'package:medtech_mobile/core/errors/failures.dart';
import 'package:medtech_mobile/features/contracts/domain/entity/contract_entity.dart';

abstract class ContractsRepo {
  Future<Either<Failure, List<ContractEntity>>> getContracts();
  Future<Either<Failure, void>> extendContract({
    required String id,
    required String newEndDate,
  });
}
