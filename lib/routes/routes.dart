import 'package:flutter/material.dart';
import 'package:login_signup/routes/screen_routes.dart';
import 'package:login_signup/screens/auth/login_screen.dart';
import 'package:login_signup/screens/auth/signup.dart';
import 'package:login_signup/screens/bottom_bar/bottom_nav_bar.dart';
import 'package:login_signup/screens/bottom_bar/products/products.dart';
import 'package:login_signup/screens/forgot_password.dart';
import 'package:login_signup/screens/splash_screen.dart';
class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RoutesName.signupScreen:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case RoutesName.bottomNavBar:
        return MaterialPageRoute(builder: (_) =>  BottomNAvBarScreen(
        ));
      case RoutesName.forgotpassword:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (_) => ProductsScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}

