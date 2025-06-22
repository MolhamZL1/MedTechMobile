import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech_mobile/core/services/custom_bloc_observer.dart';
import 'package:medtech_mobile/core/services/get_it_service.dart';
import 'package:medtech_mobile/features/auth/presentation/views/sign_in_view.dart';
import 'package:medtech_mobile/core/utils/app_themes.dart';
import 'package:medtech_mobile/core/functions/on_generate_route.dart';
import 'package:medtech_mobile/features/main/presentaion/views/main_view.dart';
import 'package:medtech_mobile/features/products/presentation/views/products_view.dart';

void main() {
  Bloc.observer = CustomBlocObserver();
  setupSingltonGetIt();
  runApp(const MedTech());
}

class MedTech extends StatelessWidget {
  const MedTech({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      onGenerateRoute: (settings) => onGenerateRoute(settings),
      // initialRoute: SignInView.routeName,
      debugShowCheckedModeBanner: false,

      home: ProductsView(),
    );
  }
}
