import 'package:dartz/dartz.dart';
import 'package:medtech_mobile/core/errors/failures.dart';

abstract class MiantainanceRepo {
  Future<Either<Failure, void>> requestMaintainance({
    required String id,
    required String issue,
    required String date,
  });
}
