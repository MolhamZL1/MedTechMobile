import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class HaveAnAccountSection extends StatelessWidget {
  const HaveAnAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("have an account?"),
        SizedBox(width: 2),
        GestureDetector(
          onTap: () {},
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Text(
              "Sign In",
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
