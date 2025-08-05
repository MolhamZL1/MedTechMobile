import 'package:flutter/foundation.dart';

abstract class BackendEndpoints {
  static const String url =
      kIsWeb ? "http://localhost:8383/api/" : "http://10.0.2.2:8383/api/";
  static const String signIn = "auth/login";
  static const String signOut = "auth/signout";
  static const String signUp = "auth/register";
  static const String verifySignUpCode = "auth/verify-code";
  static const String forgetPassword = "auth/forgot-password";
  static const String resetPassword = "auth/reset-password";
  static const String changePassword = "auth/change-password";
  //
  static const String getProducts = "products/get-products";
}
