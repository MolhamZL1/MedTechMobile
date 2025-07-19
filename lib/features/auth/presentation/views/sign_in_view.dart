import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/services/get_it_service.dart';
import 'package:medtech_mobile/features/auth/domain/repos/auth_repo.dart';
import 'package:medtech_mobile/features/auth/presentation/cubits/signin/sign_in_cubit.dart';
import 'package:medtech_mobile/features/auth/presentation/views/widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const routeName = '/sign-in';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt.get<AuthRepo>()),
      child: const Scaffold(body: SignInViewBody()),
    );
  }
}
