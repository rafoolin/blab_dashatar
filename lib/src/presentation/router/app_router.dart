import 'package:flutter/material.dart';

import '../presentation.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {

      /// Setting Screen
      case SettingScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const SettingScreen(),
        );

      /// About Screen
      case AboutScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const AboutScreen(),
        );

      /// Error Screen
      case ErrorScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const ErrorScreen(),
        );

      /// Favorite Screen
      case FavoriteScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const FavoriteScreen(),
        );

      /// LoadingScreen Screen
      case LoadingScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => LoadingScreen(),
        );

      /// DetailScreen Screen
      case DetailScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => DetailScreen(dashatar: settings.arguments),
        );

      /// Home Screen
      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(settings.arguments),
        );

      /// Main Screen
      case MainScreen.routeName:
      default:
        return MaterialPageRoute(
          builder: (context) => const MainScreen(),
        );
    }
  }
}
