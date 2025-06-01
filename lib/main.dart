import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/auth/presentation/views/sign_in_view.dart';

void main() {
  runApp(const MedTech());
}

class MedTech extends StatelessWidget {
  const MedTech({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: SignInView());
  }
}
