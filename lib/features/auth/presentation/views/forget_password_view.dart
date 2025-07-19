import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/services/get_it_service.dart';
import 'package:medtech_mobile/features/auth/domain/repos/auth_repo.dart';
import 'package:medtech_mobile/features/auth/presentation/cubits/forgetpassord/forgetasword_cubit.dart';
import 'package:medtech_mobile/features/auth/presentation/views/widgets/foreget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
  static const routeName = '/forgetpassword';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetaswordCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: AppBar(title: Text('Forget Password')),
        body: ForegetPasswordViewBody(),
      ),
    );
  }
}
