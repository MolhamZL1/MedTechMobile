import 'dart:developer';

import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/sign_in_view.dart';
import '../../features/auth/presentation/views/sign_up_view.dart';
import '../../features/main/presentaion/views/main_view.dart';
import '../../features/product_details/presentation/views/product_details_view.dart';
import '../../features/products/domain/entities/product_entitie.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    // case SplashView.routeName:
    //   return MaterialPageRoute(builder: (context) => const SplashView());
    // case OnBoardingView.routeName:
    //   return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case SignInView.routeName:
      return MaterialPageRoute(builder: (context) => const SignInView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
    case ProductDetailsView.routeName:
      return MaterialPageRoute(
        builder: (context) {
          final args = settings.arguments;

          if (args == null || args is! ProductEntitie) {
            log(args.toString());
            return Scaffold(body: Center(child: Text("No product found")));
          }

          final product = args as ProductEntitie;
          return ProductDetailsView(productEntitie: product);
        },
      );

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
