import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter_sample/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_sample/screens/sign_up/sign_up_screen.dart';
import 'package:flutter_sample/screens/verify_code/verify_code_screen.dart';
import 'package:flutter_sample/shared/routes/routes.dart';
import 'package:flutter_sample/shared/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRoutesFactory {
  final SharedPreferences sharedPreferences;
  final navigatorKey = GlobalKey<NavigatorState>();

  AuthRoutesFactory(this.sharedPreferences);

  Route<dynamic> generateRoute(BuildContext context, RouteSettings settings) {
    switch (settings.name) {
      case Routes.signIn:
        return CupertinoPageRoute(
          settings: settings,
          builder: (context) => SignInScreen(),
        );
      case Routes.signUp:
        return CupertinoPageRoute(
          settings: settings,
          builder: (context) => SignUpScreen(),
        );
      case Routes.forgotPassword:
        return CupertinoPageRoute(
          settings: settings,
          builder: (context) => ForgotPasswordScreen(),
        );
      case Routes.verifyCodeScreen:
        return CupertinoPageRoute(
          settings: settings,
          builder: (context) => VerifyCodeScreen(),
        );
      default:
        return defaultPageRoute(context, settings);
    }
  }
}
