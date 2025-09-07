import 'package:medtech_mobile/features/profile/domain/entites/edit_profile_entity.dart';


class UpdateProfileModel {
  final String username;
  final String email;
  final String number;
//  final String location;
  final String? image;

  UpdateProfileModel({
    required this.username,
    required this.email,
    required this.number,
  //  required this.location,
    this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "email": email,
      "number": number,
     // "location": location,
      "image": image,
    };
  }

  factory UpdateProfileModel.fromEntity(UpdateProfileEntity entity) {
    return UpdateProfileModel(
      username: entity.username,
      email: entity.email,
      number: entity.number,
    //  location: entity.location,
      image: entity.image,
    );
  }
}
