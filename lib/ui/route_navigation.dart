import 'package:book_apps_mvvm/ui/views/home_view.dart';
import 'package:flutter/material.dart';

class RouteNavigation {
  // static const String signUp = 'signUp';
  static const String home = 'home';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => HomeView());

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
