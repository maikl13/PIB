import 'package:flutter/material.dart';
import 'package:pip/core/resources/assets_manager.dart';
import 'package:pip/core/resources/route_manager.dart';

import 'strings_manager.dart';

class AppConstants {
  static const int splashDelay = 3;
  static const int goToHomeDelay = 1;
  static const double appBarHeight = 55;
  static const int sliderAnimationTime = 300;
  static const int timeOut = 60;
  static const String baseUrl = 'http://pib-platform.com/api/';
}

String defaultUId = '0';
String? userName;
String? token = '123';
String? userEmail;

String? userPhone;
String? userImage;

int selectedTab = 0;
int screenIndex = 0;
double rateNumber = 1.0;

final List<String> viewsTitles = [
  AppStrings.main,
  AppStrings.pib,
  AppStrings.myOrders,
  AppStrings.conversation,
  AppStrings.theMenue,
];

List<String> menuViewItemTitles = [
  AppStrings.skills,
  AppStrings.workAs,
  AppStrings.myWallet,
  AppStrings.rateUs,
  AppStrings.contactUs,
  AppStrings.whoAreWe,
  AppStrings.editPassword,
  AppStrings.logOut,
];

List<String> menuViewItemRoutes = [
  Routes.skillsViewRoute,
  Routes.workWithUsViewRoute,
  Routes.walletViewRoute,
  Routes.rateUsViewRoute,

  Routes.contactViewRoute,
  Routes.whoWeAreViewRoute,
  Routes.editPasswordViewRoute,
  Routes.splashRoute,

  // Routes.splashRoute,
];
bool val = false;
int isSelected = -1;

List<IconData> menuViewItemIcons = [
  Icons.manage_accounts,
  Icons.work,
  Icons.account_balance_wallet_rounded,
  Icons.star,
  Icons.perm_phone_msg,
  Icons.info,
  Icons.lock_outline_rounded,
  Icons.logout_rounded,
];

List<String> typesTitles = [
  AppStrings.deliverPresents,
  AppStrings.moveFurnititure,
  AppStrings.wall,
  AppStrings.wireMan,
  AppStrings.plumber,
  AppStrings.carpenter,

  // Routes.splashRoute,
];
List<String> typeIcons = [
  ImageAssets.gift,
  ImageAssets.sofa,
  ImageAssets.paint,
  ImageAssets.electrician,
  ImageAssets.wrench,
  ImageAssets.hammers,
];
