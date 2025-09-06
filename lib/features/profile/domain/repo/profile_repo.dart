import 'package:dartz/dartz.dart';
import 'package:medtech_mobile/core/errors/failures.dart';
import 'package:medtech_mobile/features/profile/domain/entites/edit_profile_entity.dart';
import 'package:medtech_mobile/features/profile/domain/entites/profile_entity.dart';


abstract class ProfileRepo {
  Future<Either<Failure, ProfileEntity>> getProfile();
  Future<Either<Failure, ProfileEntity>> 
  updateProfile(UpdateProfileEntity profile , {Object? imageFile});
}
