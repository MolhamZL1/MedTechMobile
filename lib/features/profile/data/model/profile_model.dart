// profile/data/model/profile_model.dart
import 'package:medtech_mobile/features/profile/domain/entites/profile_entity.dart';



class ProfileModel {
  final int id;
  final String username;
  final String email;
  final String? number;
  final String? image;
  final String? jobTitle;
  final String? bio;
  final bool isBanned;
  final String role;
  final DateTime createdAt;

  ProfileModel({
    required this.id,
    required this.username,
    required this.email,
    this.number,
    this.image,
    this.jobTitle,
    this.bio,
    required this.isBanned,
    required this.role,
    required this.createdAt,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      number: json['number'],
      image: json['image'],
      jobTitle: json['jobTitle'],
      bio: json['bio'],
      isBanned: json['isBanned'],
      role: json['role'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  factory ProfileModel.fromEntity(ProfileEntity entity) => ProfileModel(
        id: entity.id,
        username: entity.username,
        email: entity.email,
        number: entity.number,
        image: entity.image,
        jobTitle: entity.jobTitle,
        bio: entity.bio,
        isBanned: entity.isBanned,
        role: entity.role,
        createdAt: entity.createdAt,
      );

  ProfileEntity toEntity() => ProfileEntity(
        id: id,
        username: username,
        email: email,
        number: number,
        image: image,
        jobTitle: jobTitle,
        bio: bio,
        isBanned: isBanned,
        role: role,
        createdAt: createdAt,
      );
}
