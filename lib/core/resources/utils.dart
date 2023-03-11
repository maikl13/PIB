import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'color_manager.dart';
import 'route_manager.dart';

import 'constants.dart';

String getCountryFlag() {
  String countryCode = 'sa';
  String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
      (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
  return flag;
}

defaultAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: ColorManager.lightBlack,
    titleSpacing: 0,
    centerTitle: false,
    title: buildMainSearchViewAppBarTitle(context),
    actions: buildMainSearchViewAppBarActions(context),
  );
}

buildMainSearchViewAppBarTitle(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(right: 20.w),
    child: Text(
      viewsTitles[screenIndex],
      style: Theme.of(context).textTheme.headlineLarge,
    ),
  );
}

buildMainSearchViewAppBarActions(BuildContext context) {
  return [
    Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.notificationViewRoute);
          },
          child: Icon(
            CupertinoIcons.bell,
            color: ColorManager.white,
            size: 20.sp,
          )),
    )
  ];
}
