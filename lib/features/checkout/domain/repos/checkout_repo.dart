import 'package:dartz/dartz.dart';
import 'package:medtech_mobile/core/errors/failures.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, dynamic>> checkout();
}
