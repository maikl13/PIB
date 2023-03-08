// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/style_manager.dart';
import 'package:pip/core/resources/values_manager.dart';

import 'color_manager.dart';
import 'font_manager.dart';

ThemeData getAppTheme = ThemeData(
  dividerColor: Colors.transparent,

  scaffoldBackgroundColor: ColorManager.white,
  // main colors
  primaryColor: ColorManager.primary,

  // primaryColorLight: ColorManager.lightPrimary,
  // primaryColorDark: ColorManager.darkPrimary,
  // disabledColor: ColorManager.grey1,
  // splashColor: ColorManager.white,
  // chipTheme: ChipThemeData(pressElevation: 0),
  // ripple effect color

  //bottomanavBar

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(
      size: 24.sp,
    ),
    unselectedIconTheme: IconThemeData(
      size: 24.sp,
    ),
    // selectedLabelStyle:
    //     getBoldStyle( fontSize: 10.sp),
    backgroundColor: ColorManager.white,
    elevation: 0.0,
    selectedItemColor: ColorManager.lightSeconadary,
    unselectedItemColor: ColorManager.grey,
  ),
  // selectedLabelStyle: getBoldStyle(color: Colors.red, fontSize: 10.sp)),
  // cardview theme
  cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4),
  // app bar theme
  appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: ColorManager.black,
        size: 18.sp,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        
        statusBarColor: ColorManager.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: ColorManager.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      centerTitle: true,
      color: ColorManager.white,
      elevation: 0.0,
      // shadowColor: ColorManager.lightPrimary,
      titleTextStyle: getRegularStyle(
          fontSize: FontSize.s20.sp, color: ColorManager.black)),
  // button theme
  buttonTheme: ButtonThemeData(
    shape: const StadiumBorder(),
    disabledColor: ColorManager.cfGrey,
    // buttonColor: ColorManager.primary,
    // splashColor: ColorManager.lightPrimary,
  ),

  // elevated button them
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle: getRegularStyle(
              color: ColorManager.white, fontSize: FontSize.s17),
          // ignore: deprecated_member_use
          // primary: ColorManager.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s12)))),

  // get text theme

  textTheme: TextTheme(
    // auth title - phone auth title
    titleMedium:
        getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s22.sp),
    //------------------------------------------------------------------------------

    //auth subTitle - phone auth subtitle
    bodySmall: getRegularStyle(color: ColorManager.darkGrey, fontSize: 15.sp),
    //------------------------------------------------------------------
// button titles
    labelMedium:
        getRegularStyle(color: ColorManager.white, fontSize: FontSize.s17.sp),

    //------------------------------------------------------------------------------
//headlines like in world seach view top
    headlineSmall: getBoldStyle(color: ColorManager.darkGrey, fontSize: 13.sp),
    //------------------------------------------------------------------------------
// text inside searchbar
    displaySmall: getRegularStyle(color: ColorManager.black, fontSize: 15.sp),
    //------------------------------------------------------------------------------
// category item
    labelSmall:
        getRegularStyle(color: ColorManager.primary, fontSize: FontSize.s17.sp),
    //--------------------------------------------------------------------------
    // titlein search main app bar
    headlineLarge:
        getBoldStyle(color: ColorManager.black, fontSize: FontSize.s22.sp),
    //------------------------------------------------------------------------------
    //main search subtitle
    labelLarge: getBoldStyle(color: ColorManager.darkGrey, fontSize: 17.sp),
    //------------------------------------------------------------------------------
//body titles like home view
    displayMedium: getBoldStyle(color: ColorManager.black, fontSize: 15.5.sp),
    //------------------------------------------------------------------------------

    displayLarge:
        getSemiBoldStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),

    //------------------------------------------------------------------------------
    headlineMedium:
        getRegularStyle(color: ColorManager.black, fontSize: FontSize.s18.sp),
    //------------------------------------------------------------------------------

    //------------------------------------------------------------------------------

    titleSmall: getMediumStyle(color: ColorManager.black, fontSize: 8.sp),

    //------------------------------------------------------------------------------
    bodyLarge: getBoldStyle(color: ColorManager.white, fontSize: 18.sp),
    //------------------------------------------------------------------------------

    //------------------------------------------------------------------------------

    bodyMedium: getRegularStyle(
        color: ColorManager.lightGrey, fontSize: FontSize.s22.sp),
  ),

  // input decoration theme (text form field)

  inputDecorationTheme: InputDecorationTheme(
      fillColor: ColorManager.grey.withOpacity(.10),
      filled: true,
      contentPadding: EdgeInsets.only(right: 32.w),
      hintStyle:
          getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s17.sp),
      labelStyle:
          getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      errorStyle: getRegularStyle(color: ColorManager.error),
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.transparent, width: 1.5.sp),
          borderRadius: BorderRadius.all(Radius.circular(5.r))),
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.transparent, width: AppSize.s1_5),
          borderRadius: BorderRadius.all(Radius.circular(5.r))),
      errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.transparent, width: AppSize.s1_5),
          borderRadius: BorderRadius.all(Radius.circular(5.r))),
      focusedErrorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.transparent, width: AppSize.s1_5),
          borderRadius: BorderRadius.all(Radius.circular(5.r)))),
);
