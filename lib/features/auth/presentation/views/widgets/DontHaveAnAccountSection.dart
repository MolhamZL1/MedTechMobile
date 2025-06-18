import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../sign_up_view.dart';

class DontHaveAnAccountSection extends StatelessWidget {
  const DontHaveAnAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don’t have an account?"),
        SizedBox(width: 2),
        GestureDetector(
          onTap: () {},
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, SignUpView.routeName),
            child: Text(
              "Sign up",
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
