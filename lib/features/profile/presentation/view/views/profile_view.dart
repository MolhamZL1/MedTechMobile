// profile/presentation/view/profile_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/services/get_it_service.dart';
import 'package:medtech_mobile/features/profile/domain/repo/profile_repo.dart';
import 'package:medtech_mobile/features/profile/presentation/cubit/cubit/profile_cubit.dart';
import 'package:medtech_mobile/features/profile/presentation/cubit/cubit/profile_state.dart';
import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/profile_view_body.dart'; 

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(
        profileRepo: getIt.get<ProfileRepo>(),
      )..fetchProfile(), 
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfileLoaded) {
        
              return ProfileViewBody(profile: state.profile);
            } else if (state is ProfileError) {
              return Center(child: Text(state.message));
            } else {
              return const SizedBox(); 
            }
          },
        ),
      ),
    );
  }
}
