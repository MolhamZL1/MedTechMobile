import 'package:dartz/dartz.dart';
import 'package:medtech_mobile/core/errors/failures.dart';

import '../../../products/domain/entities/product_entitie.dart';

abstract class FavoriteRepo {
  Future<Either<Failure, void>> addToFavorite({required String id});
  Future<Either<Failure, List<ProductEntity>>> getFavorites();
}
