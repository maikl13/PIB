import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/constants.dart';

import 'app/app.dart';
import 'core/resources/bloc_observer.dart';
import 'core/resources/color_manager.dart';
import 'core/resources/injection.dart';
import 'core/resources/shared_prefrences.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor:
        ColorManager.lightBlack, // Set navigation bar color
    statusBarColor: ColorManager.lightBlack, // Set status bar color
  ));
  await CacheHelper.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');

    final fcmToken = await FirebaseMessaging.instance.getToken();
    print(fcmToken);
    fcmTokenFromFirebase = fcmToken!;
  } else {
    print('User declined or has not yet granted permission');
  }
  // FirebaseMessaging.onMessage.listen((event) {
  //   print('onMessage');
  //   print(event);
  // });

  await FirebaseAppCheck.instance.activate(
    webRecaptchaSiteKey: 'recaptcha-v3-site-key',
    // Default provider for Android is the Play Integrity provider. You can use the "AndroidProvider" enum to choose
    // your preferred provider. Choose from:
    // 1. debug provider
    // 2. safety net provider
    // 3. play integrity provider

    androidProvider: AndroidProvider.playIntegrity,
  );
  await ScreenUtil.ensureScreenSize();
  // ScreenUtil().setSp(28);
  initGetIt();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    Bloc.observer = AppObserver();
    runApp(
      MyApp(),
    );
  });
}
