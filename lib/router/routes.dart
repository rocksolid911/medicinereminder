import 'package:flutter/material.dart';
import 'package:medicinereminder/auth/login.dart';
import 'package:medicinereminder/home/screen/homepage.dart';
import 'package:medicinereminder/intropage/intropage.dart';
import 'package:medicinereminder/spalshscreen/splashscreen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CustomRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
        case '/home':
        return CustomRoute(
          builder: (_) => const HomePage(),
          settings: settings,
        );
      case '/login':
        return CustomRoute(
          builder: (_) => const LogInPage(),
          settings: settings,
        );
      case '/welcomeScreen':
        return CustomRoute(
          builder: (_) => const IntroPage(),
          settings: settings,
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return CustomRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('ERROR'),
        ),
      ),
    );
  }
}
class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute({required WidgetBuilder builder, RouteSettings? settings})
      : super(builder: builder, settings: settings);
}