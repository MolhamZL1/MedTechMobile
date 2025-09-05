// profile/presentation/cubit/profile_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:medtech_mobile/features/profile/domain/repo/profile_repo.dart';
import 'package:medtech_mobile/features/profile/presentation/cubit/cubit/profile_state.dart';
import 'package:meta/meta.dart';




class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;

  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());

  Future<void> fetchProfile() async {
    emit(ProfileLoading());
    final result = await profileRepo.getProfile();
    result.fold(
      (failure) => emit(ProfileError(failure.errMessage)),
      (profile) => emit(ProfileLoaded(profile)),
    );
  }
}
