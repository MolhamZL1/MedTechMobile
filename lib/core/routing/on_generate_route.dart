import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:medtech_mobile/features/auth/presentation/views/verify_email_view.dart';
import 'package:medtech_mobile/features/cart/domain/entities/cart_entity.dart';
import 'package:medtech_mobile/main.dart';

import '../../features/Google Map/presentation/views/google_map_view.dart';
import '../../features/ai chat/presentation/views/ai_chat_view.dart';
import '../../features/auth/presentation/views/forget_password_view.dart';
import '../../features/auth/presentation/views/resetpassword.dart';
import '../../features/auth/presentation/views/sign_in_view.dart';
import '../../features/auth/presentation/views/sign_up_view.dart';

import '../../features/checkout/presentation/views/checkout_view.dart';
import '../../features/contracts/domain/entity/contract_entity.dart';
import '../../features/contracts/presentation/views/contract_details_view.dart';
import '../../features/contracts/presentation/views/contracts_view.dart';
import '../../features/favorites/presentation/views/favorite_view.dart';
import '../../features/main/presentaion/views/main_view.dart';
import '../../features/maintainance/presentation/views/maintainance_view.dart';
import '../../features/product_details/presentation/views/product_details_view.dart';
import '../../features/products/domain/entities/product_entitie.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    // case SplashView.routeName:
    //   return MaterialPageRoute(builder: (context) => const SplashView());
    // case OnBoardingView.routeName:
    //   return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case StartScreen.routeName:
      return MaterialPageRoute(builder: (context) => const StartScreen());
    case SignInView.routeName:
      return MaterialPageRoute(builder: (context) => const SignInView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    case ForgetPasswordView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ForgetPasswordView(),
      );
    case ResetpasswordView.routeName:
      return MaterialPageRoute(builder: (context) => const ResetpasswordView());
    case VerifyEmailView.routeName:
      return MaterialPageRoute(builder: (context) => const VerifyEmailView());

    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
    case ProductDetailsView.routeName:
      return MaterialPageRoute(
        builder: (context) {
          final args = settings.arguments;

          if (args == null || args is! ProductEntity) {
            log(args.toString());
            return Scaffold(body: Center(child: Text("No product found")));
          }

          final product = args as ProductEntity;
          return ProductDetailsView(productEntitie: product);
        },
      );
    case AiChatView.routeName:
      return MaterialPageRoute(builder: (context) => const AiChatView());
    case CheckoutView.routeName:
      return MaterialPageRoute(
        builder: (context) {
          final args = settings.arguments;
          CartEntity cartEntity = args as CartEntity;
          return CheckoutView(cartEntity: cartEntity);
        },
      );
    case GoogleMapView.routeName:
      return MaterialPageRoute(builder: (context) => GoogleMapView());
    case FavoriteView.routName:
      return MaterialPageRoute(builder: (context) => FavoriteView());
    case ContractsView.routeName:
      return MaterialPageRoute(builder: (context) => ContractsView());
    case MaintainanceView.routeName:
      return MaterialPageRoute(
        builder: (context) {
          String productId = settings.arguments as String;
          return MaintainanceView(productId: productId);
        },
      );
    case ContractDetailsView.routeName:
      return MaterialPageRoute(
        builder: (context) {
          final args = settings.arguments;
          ContractEntity contractEntity = args as ContractEntity;

          return ContractDetailsView(contractEntity: contractEntity);
        },
      );
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
