import 'package:flutter/material.dart';
import 'package:pip/features/auth/presentation/screens/login_view.dart';
import 'package:pip/features/auth/presentation/screens/main_auth_view.dart';

import 'package:pip/features/splash/presentation/screens/on_boarding_view.dart';
import '../../features/splash/presentation/screens/splash_view.dart';
import 'strings_manager.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingViewRoute = "/onBoardingViewRoute";

  static const String mainAuthViewRoute = "/mainAuthViewRoute";
  static const String registerViewRoute = "/registerViewRoute";
  static const String loginViewRoute = "/loginViewRoute";

}

class RouteGenerator {
  Route? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );
      case Routes.onBoardingViewRoute:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingView(),
        );
      case Routes.mainAuthViewRoute:
        return MaterialPageRoute(
          builder: (_) => const MainAuthView(),
        );

      case Routes.registerViewRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(AppStrings.noRouteFound.trim()),
              ),
              body: Center(child: Text(AppStrings.noRouteFound.trim())),
            ));
  }
}
