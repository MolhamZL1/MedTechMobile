import 'package:dartz/dartz.dart';
import 'package:medtech_mobile/core/errors/failures.dart';
import 'package:medtech_mobile/features/checkout/data/model/rentedItemmodel.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> checkout({
    required String address,
    required List<Renteditemmodel> rentedItems,
  });
}
