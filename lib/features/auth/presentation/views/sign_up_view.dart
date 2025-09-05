import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/services/get_it_service.dart';
import 'package:medtech_mobile/features/auth/domain/repos/auth_repo.dart';
import 'package:medtech_mobile/features/auth/presentation/cubits/signup/sign_up_cubit.dart';
import 'package:medtech_mobile/features/auth/presentation/views/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String routeName = '/sign-up';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(getIt.get<AuthRepo>()),
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: SignUpViewBody(),
      ),
    );
  }
}
