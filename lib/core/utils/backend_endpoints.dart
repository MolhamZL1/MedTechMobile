import 'package:flutter/foundation.dart';

abstract class BackendEndpoints {
  static const String url = // "https://0e03b862fd24.ngrok-free.app/";
      kIsWeb ? "http://localhost:8383/" : "http://10.0.2.2:8383/";
  static const String signIn = "api/auth/login";
  static const String signOut = "api/auth/signout";
  static const String signUp = "api/auth/register";
  static const String verifySignUpCode = "api/auth/verify-code";
  static const String forgetPassword = "api/auth/forgot-password";
  static const String resetPassword = "api/auth/reset-password";
  static const String changePassword = "api/auth/change-password";
  //
  static const String getProducts = "api/products/get-products";
  //
  static const String getCartItems = "api/products/get-cart";
  static const String updateCartItem = "api/products/add-to-cart";
  //
  static const String sendAiMessage = "api/ai-chat/message";
  static const String getAiMessages = "api/ai-chat/messages";
  //
}
