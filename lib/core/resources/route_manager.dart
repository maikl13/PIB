import 'package:flutter/material.dart';
import 'package:pip/features/splash/presentation/screens/on_boarding_view.dart';
import '../../features/splash/presentation/screens/splash_view.dart';
import 'strings_manager.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingViewRoute = "/onBoardingViewRoute";

  static const String mainAuthViewRoute = "/mainAuthViewRoute";
  
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
