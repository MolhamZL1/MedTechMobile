// profile/presentation/view/profile_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/features/profile/presentation/cubit/cubit/profile_state.dart';
import 'package:medtech_mobile/features/profile/presentation/cubit/cubit/profile_cubit.dart';

import 'package:medtech_mobile/features/profile/presentation/view/views/widgets/profile_view_body.dart'; 

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
  listenWhen: (previous, current) =>
      previous is ProfileLoading && current is ProfileLoaded,
  listener: (context, state) {
    final cubit = context.read<ProfileCubit>();
    if (cubit.isUpdating && state is ProfileLoaded) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("✅ تم تحديث البيانات بنجاح")),
      );
    }
  },
  child: BlocBuilder<ProfileCubit, ProfileState>(
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
);
  }
}
