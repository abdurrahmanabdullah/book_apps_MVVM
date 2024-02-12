import 'package:book_apps_mvvm/ui/views/Authentication/authentication.dart';
import 'package:book_apps_mvvm/ui/views/Authentication/registration.dart';
import 'package:book_apps_mvvm/ui/views/free_book.dart';
import 'package:book_apps_mvvm/ui/views/home_view.dart';
import 'package:book_apps_mvvm/ui/views/test.dart';
import 'package:flutter/material.dart';

class RouteNavigation {
  //
  static const String freeBook = 'freeBook';
  static const String home = 'home';
  static const String authentication = 'authentication';
  static const String registration = 'registration';
  static const String test = 'test';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => HomeView());
      case freeBook:
        return MaterialPageRoute(builder: (context) => const FreeBook());
      case authentication:
        return MaterialPageRoute(builder: (context) => const Authentication());
      case registration:
        return MaterialPageRoute(builder: (context) => const Registration());
      case test:
        return MaterialPageRoute(builder: (context) => const Test());

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
