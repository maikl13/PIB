import 'package:pip/core/resources/strings_manager.dart';

class AppConstants {
  static const int splashDelay = 3;
  static const int goToHomeDelay = 1;
  static const double appBarHeight = 55;
  static const int sliderAnimationTime = 300;
  static const int timeOut = 60;
  static const String baseUrl = 'http://merchant-admin.com/api/';
}

String defaultUId = '0';
String userName = '';
String token = '123';
String userPhone = '';
String userImage = '';

int selectedTab = 0;
int screenIndex = 0;

final List<String> viewsTitles = [
  AppStrings.main,
  AppStrings.pib,
  AppStrings.myOrders,
  AppStrings.messages,
  AppStrings.personalInfo,
];
