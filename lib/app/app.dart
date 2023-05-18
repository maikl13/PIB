// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/business_logic/global_cubit.dart';
import 'package:pip/core/internet/internet_connection_checker.dart';

import '../core/resources/constants.dart';
import '../core/resources/injection.dart';
import '../core/resources/route_manager.dart';
import '../core/resources/shared_prefrences.dart';
import '../core/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  MyApp._internal();

  static final MyApp _instance = MyApp._internal(); // single instance

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tokenFromDatabase = CacheHelper.getData(key: 'token');
  var userPicFromDatabase = CacheHelper.getData(key: 'userImage');
  var userNameFromDatabase = CacheHelper.getData(key: 'userName');
  var userPhoneFromDatabase = CacheHelper.getData(key: 'userPhone');
  var userGoToHomePage = CacheHelper.getData(key: 'goToHome');
  var userIdFromDatabase = CacheHelper.getData(key: 'uid');
  var countryCodeFromDatabase = CacheHelper.getData(key: 'countryCode');

  String getInitialScreen() {
    if (userNameFromDatabase == 'مجهول') {
      FirebaseAuth.instance.signOut();

      return Routes.splashRoute;
    } else {
      if (userGoToHomePage != null) {
        defaultUId = userIdFromDatabase;
        token = tokenFromDatabase;
        userImage = userPicFromDatabase;
        userName = userNameFromDatabase;
        userPhone = userPhoneFromDatabase;
        countryCode = countryCodeFromDatabase;

        return Routes.mainHomeViewRoute;
      } else {
        return Routes.splashRoute;
      }
    }
  }

  // factory to get single instance
  RouteGenerator routeGenerator = RouteGenerator();

// factory to get single instance
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<GlobalCubit>(),
        child: ScreenUtilInit(
            designSize: const Size(375, 812),
            useInheritedMediaQuery: true,
            minTextAdapt: true,
            builder: (context, state) {
              // ScreenUtil().setSp(28);
              return MaterialApp(
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale('ar'),
                    Locale('en')
                  ],
                  locale: const Locale('ar'),
                  debugShowCheckedModeBanner: false,
                  onGenerateRoute: routeGenerator.getRoute,
                  initialRoute: getInitialScreen(),
                  theme: getAppTheme,
                  // darkTheme: MyThemes.buyerTheme,

                  // initialRoute: Routes.splashRoute,
                  builder: (context, child) {
                    return MediaQuery(
                      data:
                          MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                      child: InternetConnectionChecker(
                        child: child,
                      ),
                    );
                  });
            }));
  }
}
