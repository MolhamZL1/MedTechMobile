import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/utils/app_colors.dart';
import 'package:medtech_mobile/features/auth/presentation/cubits/signin/sign_in_cubit.dart';

import '../../../core/widgets/show_question_dialog.dart';
import '../../auth/presentation/views/sign_in_view.dart';

class Logoutbutton extends StatelessWidget {
  const Logoutbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15),

      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          final navigator = Navigator.of(context);
          showQuestionDialog(
            context: context,
            title: "Sign Out",
            description: "Are you sure you want to sign out",
            btnOkOnPress: () async {
              showDialog(
                context: context,
                builder:
                    (context) =>
                        const Center(child: CircularProgressIndicator()),
              );

              await context.read<SignInCubit>().signout();
              if (navigator.mounted) {
                navigator.pushReplacementNamed(SignInView.routeName);
              }
            },
          );
        },
        child: Container(
          padding: EdgeInsets.all(17),

          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.red.withOpacity(0.3), width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.logout, color: Colors.red),
              SizedBox(width: 10),
              Text("تسجيل الخروج ", style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
      ),
    );
  }
}
