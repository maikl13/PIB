// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/resources/route_manager.dart';
import '../core/resources/theme_manager.dart';

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  // MyApp._internal();

  // static final MyApp _instance = MyApp._internal(); // single instance

  // factory MyApp() => _instance; // factory to get single instance
  RouteGenerator routeGenerator = RouteGenerator();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // useInheritedMediaQuery: true,
      // scaleByHeight: true,

      builder: (context, state) {
        return MaterialApp(
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('ar'), Locale('en')],
          locale: const Locale('ar'),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: routeGenerator.getRoute,
          theme: getAppTheme,
          // darkTheme: MyThemes.buyerTheme,

          // initialRoute: Routes.splashRoute,
        );
      },
    );
  }
}
