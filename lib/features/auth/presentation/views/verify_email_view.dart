import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/features/auth/presentation/cubits/verifycode/verifycode_cubit.dart';

import '../../../../core/services/get_it_service.dart';
import '../../domain/repos/auth_repo.dart';
import 'widgets/VerifyEmailViewBody.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  static const routeName = '/verifyemail';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifycodeCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: AppBar(title: Text('Verify Email')),
        body: VerifyEmailViewBody(),
      ),
    );
  }
}
