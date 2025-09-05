// profile/domain/repo/profile_repo.dart
import 'package:dartz/dartz.dart';
import 'package:medtech_mobile/features/profile/domain/entites/profile_entity.dart';
import '../../../../core/errors/failures.dart';


abstract class ProfileRepo {
  Future<Either<Failure, ProfileEntity>> getProfile();
}
