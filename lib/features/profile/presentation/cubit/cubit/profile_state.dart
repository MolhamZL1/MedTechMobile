

import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/profile/domain/entites/profile_entity.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final ProfileEntity profile;
  ProfileLoaded(this.profile);
}

final class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}
