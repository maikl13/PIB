import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pip/core/resources/assets_manager.dart';
import 'package:pip/core/resources/strings_manager.dart';
import 'package:pip/core/resources/style_manager.dart';
import 'package:pip/core/widgets/default_button.dart';

import 'package:url_launcher/url_launcher.dart';

import '../widgets/confirmation_dialog.dart';
import '../widgets/loading_indicator.dart';
import 'color_manager.dart';
import 'font_manager.dart';

class Commons {
  static Future<void> showLoadingDialog(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  // key: key,
                  backgroundColor: ColorManager.lightBlack,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        const LoadingIndicator(),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Please Wait....",
                          style: TextStyle(color: ColorManager.black),
                        )
                      ]),
                    )
                  ]));
        });
  }

  static void showErrorDialog(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: Text(
                message,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: FontConstants.defaultFontFamily),
              ),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: FontConstants.defaultFontFamily,
                          fontSize: 14)),
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('ok'),
                ),
              ],
            ));
  }

  static void showToast({
    required String message,
    Color? color,
    ToastGravity? gravity,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity ?? ToastGravity.BOTTOM,
      backgroundColor: color ?? ColorManager.error,
    );
  }

  static Future<void> showLogoutDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) =>
            ConfirmationDialog(alertMsg: 'alert', onTapConfirm: () {}));
  }

  static Future<void> openUrl(String urlLink) async {
    final Uri url = Uri.parse(urlLink);
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}

void showErrorDialog(BuildContext context, String message) {
  showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
            title: Text(
              message,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: FontConstants.defaultFontFamily),
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: FontConstants.defaultFontFamily,
                        fontSize: 14)),
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('ok'),
              ),
            ],
          ));
}

void showSuccessDialog(BuildContext context) {
  AlertDialog alertDialog = AlertDialog(
    backgroundColor: ColorManager.transparent,
    contentPadding: EdgeInsets.zero,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
    content: Stack(children: [
      Image.asset(
        ImageAssets.successBackground,
        fit: BoxFit.cover,
        width: 295.w,
        height: 492.h,
        // width: double.infinity,
      ),
      Padding(
        padding: EdgeInsets.only(top: 20.h, right: 20.w),
        child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.close,
              color: ColorManager.white,
              size: 20.sp,
            )),
      ),
      Padding(
        padding: EdgeInsets.only(top: 264.h),
        // alignment: Alignment.center,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppStrings.thankYou,
              style: getBoldStyle(fontSize: 22.sp, color: ColorManager.white),
            ),
            SizedBox(height: 22.h),
            Padding(
              padding: EdgeInsets.only(left: 44.w, right: 44.w),
              child: Text(
                textAlign: TextAlign.center,
                AppStrings.successAuthDesc,
                style:
                    getRegularStyle(fontSize: 13.sp, color: ColorManager.grey),
              ),
            ),
            SizedBox(height: 62.h),
            DefaultButton(
              text: AppStrings.agree,
              widht: 165.w,
              onTap: () {
              Navigator.pop(context);
                
              },
            ),
          ],
        ),
      ),
    ]),
  );
  showDialog(
    barrierColor: Colors.black.withOpacity(0.8),
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return alertDialog;
    },
  );
}

void showProgressIndicator(BuildContext context) {
  AlertDialog alertDialog = AlertDialog(
    backgroundColor: ColorManager.primary,
    elevation: 0,
    content: const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
      ),
    ),
  );

  showDialog(
    barrierColor: Colors.white.withOpacity(0),
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return alertDialog;
    },
  );
}
