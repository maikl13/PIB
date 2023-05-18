import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'route_manager.dart';
import 'assets_manager.dart';
import 'strings_manager.dart';
import 'style_manager.dart';
import '../widgets/default_button.dart';

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
            child: Dialog(
              backgroundColor: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const LoadingIndicator(),
                    SizedBox(height: 16.h),
                    AnimatedTextKit(
                      animatedTexts: [
                        FlickerAnimatedText(
                          "برجاء الانتظار...",
                        ),
                      ],
                      isRepeatingAnimation: true,
                      onTap: () {
                        // print("Tap Event");
                      },
                    ),
                    // Text(
                    //   "برجاء الانتظار...",
                    //   style: TextStyle(
                    //     fontSize: 18.0,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          );
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

  static Future<void> showChatSettingDialog(BuildContext context,
      {void Function()? onReportTap}) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              backgroundColor: ColorManager.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.zero,
              content: Container(
                height: 200.h,
                width: 295.w,
                decoration: BoxDecoration(
                  color: ColorManager.lightBlack,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Padding(
                  padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.close,
                              color: ColorManager.white, size: 20.sp)),
                      SizedBox(height: 27.h),
                      // Container(
                      //   width: double.infinity,
                      //   height: 63.h,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10.r),
                      //       color: ColorManager.grey6),
                      //   child: Center(
                      //     child: Text(
                      //       AppStrings.deleteChat,
                      //       style: getRegularStyle(
                      //           fontSize: 16.sp, color: ColorManager.white),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 12.h),
                      Container(
                        width: double.infinity,
                        height: 63.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: ColorManager.grey6),
                        child: InkWell(
                          onTap: onReportTap,
                          child: Center(
                            child: Text(
                              AppStrings.report,
                              style: getRegularStyle(
                                  fontSize: 16.sp, color: ColorManager.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  static Future<void> showSettingDialog(BuildContext context,
      {void Function()? onEditTab, void Function()? onDeleteTap}) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              backgroundColor: ColorManager.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.zero,
              content: Container(
                height: 248.h,
                width: 295.w,
                decoration: BoxDecoration(
                  color: ColorManager.lightBlack,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Padding(
                  padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.close,
                              color: ColorManager.white, size: 20.sp)),
                      SizedBox(height: 27.h),
                      InkWell(
                        onTap: onEditTab,
                        child: Container(
                          width: double.infinity,
                          height: 63.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: ColorManager.grey6),
                          child: Center(
                            child: Text(
                              AppStrings.modifyRequest,
                              style: getRegularStyle(
                                  fontSize: 16.sp, color: ColorManager.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      InkWell(
                        onTap: onDeleteTap,
                        child: Container(
                          width: double.infinity,
                          height: 63.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: ColorManager.grey6),
                          child: Center(
                            child: Text(
                              AppStrings.cancelRequest,
                              style: getRegularStyle(
                                  fontSize: 16.sp, color: ColorManager.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
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
    content: ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: SizedBox(
        height: 492.h,
        child: Stack(fit: StackFit.expand, children: [
          _buildBackGround(),
          // _buildCloseButton(context),
          Padding(
            padding: EdgeInsets.only(
              top: 264.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTitle(AppStrings.thankYou),
                SizedBox(height: 22.h),
                _buildDescription(AppStrings.successAuthDesc),
                SizedBox(height: 62.h),
                Padding(
                  padding: EdgeInsets.only(right: 65.h, left: 65.h),
                  child: DefaultButton(
                    text: AppStrings.agree,
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, Routes.mainHomeViewRoute, (route) => false);
                    },
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    ),
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

void showContactSuccessDialog(BuildContext context, {void Function()? onOk}) {
  AlertDialog alertDialog = AlertDialog(
    backgroundColor: ColorManager.transparent,
    contentPadding: EdgeInsets.zero,
    content: ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: SizedBox(
        height: 492.h,
        child: Stack(fit: StackFit.expand, children: [
          _buildBackGround(),
          // _buildCloseButton(context),
          Padding(
            padding: EdgeInsets.only(
              top: 264.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTitle(AppStrings.thanksForContacting),
                SizedBox(height: 22.h),
                _buildDescription(AppStrings.willTry),
                SizedBox(height: 62.h),
                Padding(
                  padding: EdgeInsets.only(right: 65.h, left: 65.h),
                  child: DefaultButton(
                    text: AppStrings.agree,
                    onTap: onOk,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    ),
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

void showSuccessOfferDialog(BuildContext context, {void Function()? onOk}) {
  AlertDialog alertDialog = AlertDialog(
    backgroundColor: ColorManager.transparent,
    contentPadding: EdgeInsets.zero,
    content: ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: SizedBox(
        height: 515.h,
        child: Stack(fit: StackFit.expand, children: [
          _buildBackGround(),
          // _buildCloseButton(context),
          Padding(
            padding: EdgeInsets.only(
              top: 264.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTitle(AppStrings.succesOperation),
                SizedBox(height: 22.h),
                _buildDescription(AppStrings.succsesAdd),
                SizedBox(height: 22.h),
                _buildSubtitle(AppStrings.plumber),
                SizedBox(height: 62.h),
                Padding(
                  padding: EdgeInsets.only(right: 65.h, left: 65.h),
                  child: DefaultButton(
                    text: AppStrings.agree,
                    onTap: onOk,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    ),
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

void showSuccessAddOfferInChatDialog(BuildContext context,
    {void Function()? onOk}) {
  AlertDialog alertDialog = AlertDialog(
    backgroundColor: ColorManager.transparent,
    contentPadding: EdgeInsets.zero,
    content: ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: SizedBox(
        height: 515.h,
        child: Stack(fit: StackFit.expand, children: [
          _buildBackGround(),
          // _buildCloseButton(context),
          Padding(
            padding: EdgeInsets.only(
              top: 264.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTitle(AppStrings.succesOperation),
                SizedBox(height: 22.h),
                _buildDescription(AppStrings.succsesAddOnJob),
                SizedBox(height: 22.h),
                _buildSubtitle(AppStrings.needPlumber),
                SizedBox(height: 62.h),
                Padding(
                  padding: EdgeInsets.only(right: 65.h, left: 65.h),
                  child: DefaultButton(
                    text: AppStrings.agree,
                    onTap: onOk,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    ),
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

_buildSubtitle(String title) {
  return Text(
    title,
    style: getRegularStyle(fontSize: 14.sp, color: ColorManager.darkSeconadry)
        .copyWith(decoration: TextDecoration.underline, decorationThickness: 2),
  );
}

// _buildCloseButton(BuildContext context) {
//   return Padding(
//     padding: EdgeInsets.only(top: 20.h, right: 20.w),
//     child: InkWell(
//         onTap: () {
//           // Navigator.pop(context);
//         },
//         child: Align(
//           alignment: Alignment.topRight,
//           child: Icon(
//             Icons.close,
//             color: ColorManager.white,
//             size: 20.sp,
//           ),
//         )),
//   );
// }

_buildBackGround() {
  return Image.asset(
    ImageAssets.successBackground,
    fit: BoxFit.cover,
    width: 295.w,
    height: 492.h,
    // width: double.infinity,
  );
}

_buildTitle(String title) {
  return Text(
    title,
    style: getBoldStyle(fontSize: 22.sp, color: ColorManager.white),
  );
}

_buildDescription(String desc) {
  return Padding(
    padding: EdgeInsets.only(left: 44.h, right: 44.h),
    child: Text(
      textAlign: TextAlign.center,
      desc,
      style: getRegularStyle(fontSize: 13.sp, color: ColorManager.white),
    ),
  );
}

void showProgressIndicator(BuildContext context) {
  AlertDialog alertDialog = AlertDialog(
    backgroundColor: ColorManager.lightBlack,
    elevation: 0,
    content: const Center(
      child: LoadingIndicator(),
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
