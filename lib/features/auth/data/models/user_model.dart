import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/user_entity.dart';

class UserModel {
  final String name;
  final String email;

  final String token;
  const UserModel({
    required this.name,
    required this.email,
    required this.token,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['username'] ?? '',
      email: json['email'] ?? '',
      token: json['token'],
    );
  }
  factory UserModel.fromEntity(UserEntity userEntity) {
    return UserModel(
      name: userEntity.name,
      email: userEntity.email,
      token: userEntity.token,
    );
  }

  toJson() => {"username": name, "email": email, "token": token};
  toEntity() => UserEntity(name: name, email: email, token: token);
}
