import 'package:book_apps_mvvm/locator.dart';
import 'package:book_apps_mvvm/ui/route_navigation.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Architecture MVVM Provider',
      initialRoute: RouteNavigation.home,
      onGenerateRoute: RouteNavigation.generateRoute,
    );
  }
}
