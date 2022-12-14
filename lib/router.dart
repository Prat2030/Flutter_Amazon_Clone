import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:flutter_amazon_clone/features/home/screens/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  // Here we are defining all the routes and their corresponding screens
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(builder: (_) => AuthScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (_) => HomeScreen());
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${routeSettings.name}'),
                ),
              ));
  }
}
