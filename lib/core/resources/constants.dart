import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pip/core/resources/route_manager.dart';

import 'strings_manager.dart';

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
  AppStrings.conversation,
  AppStrings.theMenue,
];

List<String> menuViewItemTitles = [
  AppStrings.days,
  AppStrings.myOrders,
  AppStrings.myOrders,
  AppStrings.myOrders,
  AppStrings.myOrders,
  AppStrings.myOrders,
  AppStrings.myOrders,
  AppStrings.myOrders,
];

List<String> menuViewItemRoutes = [
  Routes.mainHomeViewRoute,
  Routes.mainHomeViewRoute,
  Routes.mainHomeViewRoute,
  Routes.mainHomeViewRoute,

  Routes.mainHomeViewRoute,
  Routes.mainHomeViewRoute,
  Routes.mainHomeViewRoute,
  Routes.mainHomeViewRoute,

  // Routes.splashRoute,
];
List<IconData> menuViewItemIcons = [
  Icons.perm_data_setting_sharp,
  Icons.cases,
  Icons.account_balance_wallet_rounded,
  Icons.star,
  Icons.perm_phone_msg,
  Icons.info,
  Icons.lock_outline_rounded,
  Icons.logout_rounded,
];
