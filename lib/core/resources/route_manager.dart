import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pip/features/auth/presentation/screens/forgot_password_view.dart';
import 'package:pip/features/auth/presentation/screens/login_view.dart';
import 'package:pip/features/auth/presentation/screens/main_auth_view.dart';
import 'package:pip/features/auth/presentation/screens/register_view.dart';
import 'package:pip/features/home/presentation/screens/jop_details_view.dart';
import 'package:pip/features/home/presentation/screens/main_home_view.dart';
import 'package:pip/features/notification/presentation/screens/notification_view.dart';
import 'package:pip/features/pip/presentation/screens/fast_request_view.dart';
import 'package:pip/features/pip/presentation/screens/pick_request_type.dart';
import 'package:pip/features/pip/presentation/screens/special_request_details.dart';
import 'package:pip/features/requests/presentation/screens/my_requests_main_view.dart';
import 'package:pip/features/search/presentation/screens/search_main_view.dart';

import 'package:pip/features/splash/presentation/screens/on_boarding_view.dart';
import '../../features/home/business_logic/cubit/home_cubit.dart';
import '../../features/home/presentation/screens/home_view.dart';
import '../../features/splash/presentation/screens/splash_view.dart';
import 'injection.dart';
import 'strings_manager.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingViewRoute = "/onBoardingViewRoute";

  static const String mainAuthViewRoute = "/mainAuthViewRoute";
  static const String registerViewRoute = "/registerViewRoute";
  static const String loginViewRoute = "/loginViewRoute";
  static const String forgotPasswordViewRoute = "/forgotPasswordViewRoute";

  static const String mainHomeViewRoute = "/mainHomeViewRoute";
  static const String jobDetailsViewRoute = "/jobDetailsViewRoute";

  static const String notificationViewRoute = "/notificationViewRoute";

  static const String searchMainViewRoute = "/searchMainViewRoute";
  static const String specialRequestViewRoute = "/specialRequestViewRoute";
  static const String fastRequestViewRoute = "/fastRequestViewRoute";

}

class RouteGenerator {
  static late HomeCubit homeCubit;

  RouteGenerator() {
    homeCubit = getIt<HomeCubit>();
  }
  static List screens = <Widget>[
    const HomeView(),
    const PickRequestTypeView(),
    const MyRequestsMainView(),
    const HomeView(),
    const HomeView(),
  ];

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

      case Routes.loginViewRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );

      case Routes.forgotPasswordViewRoute:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordView(),
        );

      case Routes.registerViewRoute:
        return MaterialPageRoute(
          builder: (_) => const RegisterView(),
        );

      case Routes.mainHomeViewRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: homeCubit,
            child: const MainHomeView(),
          ),
        );

      case Routes.notificationViewRoute:
        return MaterialPageRoute(
          builder: (_) => const NotificationView(),
        );

      case Routes.jobDetailsViewRoute:
        return MaterialPageRoute(
          builder: (_) => const JobDetailsView(),
        );

      case Routes.searchMainViewRoute:
        return MaterialPageRoute(
          builder: (_) => const SearchMainView(),
        );
      case Routes.specialRequestViewRoute:
        return MaterialPageRoute(
          builder: (_) => const SpecialRequestDetailsView(),
        );
           case Routes.fastRequestViewRoute:
        return MaterialPageRoute(
          builder: (_) => const FastRequestView(),
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
