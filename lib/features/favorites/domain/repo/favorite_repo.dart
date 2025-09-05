import 'package:dartz/dartz.dart';
import 'package:medtech_mobile/core/errors/failures.dart';

abstract class FavoriteRepo {
  Future<Either<Failure, void>> addToFavorite({required String id});
}
