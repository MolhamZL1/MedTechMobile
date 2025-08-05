import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/product_entitie.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts({
    required String category,
  });
}
