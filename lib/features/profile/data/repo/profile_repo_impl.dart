import 'dart:io';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:medtech_mobile/core/errors/failures.dart';
import 'package:medtech_mobile/core/services/database_service.dart';
import 'package:medtech_mobile/core/utils/backend_endpoints.dart';
import 'package:medtech_mobile/features/profile/data/model/profile_model.dart';
import 'package:medtech_mobile/features/profile/data/model/update_profile_model.dart';
import 'package:medtech_mobile/features/profile/domain/entites/edit_profile_entity.dart';
import 'package:medtech_mobile/features/profile/domain/entites/profile_entity.dart';
import 'package:medtech_mobile/features/profile/domain/repo/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  final DatabaseService databaseService;

  ProfileRepoImpl({required this.databaseService});

  @override
  Future<Either<Failure, ProfileEntity>> getProfile() async {
    try {
      final data = await 
      databaseService.getData(endpoint: BackendEndpoints.profile);
      final profile = ProfileModel.fromJson(data).toEntity();
      return right(profile);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> updateProfile(
    UpdateProfileEntity profile, {
    Object? imageFile,
  }) async {
    try {
      final model = UpdateProfileModel.fromEntity(profile);


      FormData dataToSend = FormData.fromMap(model.toJson());
      if (imageFile != null) {
        if (kIsWeb) {
          dataToSend.files.add(MapEntry(
            "image",
            MultipartFile.fromBytes(imageFile as Uint8List, filename: "profile.png"),
          ));
        } else {
          dataToSend.files.add(MapEntry(
            "image",
            await MultipartFile.fromFile((imageFile as File).path, filename: "profile.png"),
          ));
        }
      }
print('Sending update request to: ${BackendEndpoints.editprofile}');
print('Data to send: ${dataToSend.fields}');
      final response = await databaseService.updateData(
        endpoint: BackendEndpoints.editprofile,
        data: dataToSend, method: 'PATCH',
      );

      final updatedProfile = ProfileModel.fromJson(response['user']).toEntity();
      return right(updatedProfile);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
