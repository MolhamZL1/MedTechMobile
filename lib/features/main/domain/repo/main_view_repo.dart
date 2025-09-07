import 'package:dartz/dartz.dart';
import 'package:medtech_mobile/core/errors/failures.dart';
import 'package:medtech_mobile/features/main/domain/entity/main_view_entity.dart';

abstract class MainViewRepo {
  Future<Either<Failure, MainViewEntity>> getMainView();
}
