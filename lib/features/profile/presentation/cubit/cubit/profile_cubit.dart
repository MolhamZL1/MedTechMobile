// profile/presentation/cubit/profile_cubit.dart
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:medtech_mobile/features/profile/domain/entites/edit_profile_entity.dart';
import 'package:medtech_mobile/features/profile/domain/entites/profile_entity.dart';
import 'package:medtech_mobile/features/profile/domain/repo/profile_repo.dart';
import 'package:medtech_mobile/features/profile/presentation/cubit/cubit/profile_state.dart';
import 'package:meta/meta.dart';

import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:medtech_mobile/features/profile/domain/entites/edit_profile_entity.dart';
import 'package:medtech_mobile/features/profile/domain/entites/profile_entity.dart';
import 'package:medtech_mobile/features/profile/domain/repo/profile_repo.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;

  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());
bool isUpdating = false; 
  File? pickedImage;
  Uint8List? webPickedImage;

  Future<void> fetchProfile() async {
    emit(ProfileLoading());
    final result = await profileRepo.getProfile();
    result.fold(
      (failure) => emit(ProfileError(failure.errMessage)),
      (profile) => emit(ProfileLoaded(profile)),
    );
  }
Future<void> updateProfile(UpdateProfileEntity profile, {Object? imageFile}) async {
  isUpdating = true; 
  emit(ProfileLoading());

  final result = await profileRepo.updateProfile(profile, imageFile: imageFile);

  result.fold(
    (failure) {
      emit(ProfileError(failure.errMessage));
    },
    (updatedProfile) {
      emit(ProfileLoaded(updatedProfile)); 
    },
  );
}



  
}




// class ProfileCubit extends Cubit<ProfileState> {
//   final ProfileRepo profileRepo;

//   ProfileCubit({required this.profileRepo}) : super(ProfileInitial());

//  File? pickedImage;
//     Uint8List? webPickedImage;

//   Future<void> fetchProfile() async {
//     emit(ProfileLoading());
//     final result = await profileRepo.getProfile();
//     result.fold(
//       (failure) => emit(ProfileError(failure.errMessage)),
//       (profile) => emit(ProfileLoaded(profile)),
//     );
//   }
 
    


// Future<void> updateProfile({
//   required String username,
//   required String email,
//   required String number,
//   required String location,
//  // String? image,
// }) async {
//   emit(ProfileLoading());
// /////
// final pickedFile = kIsWeb ? webPickedImage : pickedImage;


//   final profile = UpdateProfileEntity(
//     username: username,
//     email: email,
//     number: number,
//     location: location,
//      image: null,
//        // image: kIsWeb ? webPickedImage : pickedImage,
//   );
//  //final pickedFile = kIsWeb ? webPickedImage : pickedImage;

//   final result = await profileRepo.updateProfile(profile,imageFile: pickedFile);

//   result.fold(
//     (failure) => emit(ProfileError(failure.errMessage)),
//     (profile) => emit(ProfileLoaded(profile)),
//   );
// }

// }
