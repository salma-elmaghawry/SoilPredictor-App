import 'package:flutter/material.dart';
import 'package:soilpredictor/core/helpers/app_constants.dart';
import 'package:soilpredictor/feature/home/ui/screens/home_screen.dart';

class AppRouter {
  static const String home = '/home';
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppConstants.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
