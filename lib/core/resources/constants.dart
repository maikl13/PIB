import 'package:geolocator/geolocator.dart';

import 'assets_manager.dart';
import 'route_manager.dart';

import 'strings_manager.dart';

class AppConstants {
  static const int splashDelay = 3;
  static const int goToHomeDelay = 1;
  static const double appBarHeight = 55;
  static const int sliderAnimationTime = 300;
  static const int timeOut = 60;
  static const String baseUrl = 'http://pib-platform.com/api/';
}

String fastRequsetStatus = "0";
String categoryId = '';
String description = '';
String myLocationLat = '';
String myLocationLng = '';
String myDestinationLat = '';
String myDestinationLng = '';
String apiKey = 'AIzaSyAcvWQdfMH2eKHvaTvM3g5c3N8lLXpKxLg';
String? countryCode = '+966';
String defaultUId = "68";
String? userName = 'مجهول';
String? token = '';
String? userEmail = '';
bool isLogin = true;
String? fireBaseId = '';
Position? position;

// bool isRead;

String? currentRequestId;
bool isAnonymous = false;
String? userPhone = '';
String? userImage =
    'https://th.bing.com/th/id/OIP.8R95WJtQhwmzvFvd75zrVQHaHa?pid=ImgDet&w=1490&h=1490&rs=1';

// int selectedTab = 0;
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
  // AppStrings.editPassword,
  AppStrings.logOut,
];

List<String> menuViewItemRoutes = [
  Routes.skillsViewRoute,
  Routes.workWithUsViewRoute,
  Routes.walletViewRoute,
  Routes.rateUsViewRoute,
  Routes.contactViewRoute,
  Routes.whoWeAreViewRoute,
  Routes.splashRoute,

  // Routes.splashRoute,
];
bool val = false;
int isSelected = -1;

List<String> menuViewItemIcons = [
  ImageAssets.experience,
  ImageAssets.suitcase,
  ImageAssets.wallet,
  ImageAssets.star,
  ImageAssets.menuPhone,
  ImageAssets.info,
  // Icons.lock_outline_rounded,
  ImageAssets.logout,
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
