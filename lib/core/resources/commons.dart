
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
              // actions: <Widget>[
              //   TextButton(
              //     style: TextButton.styleFrom(
              //         foregroundColor: Colors.black,
              //         textStyle: const TextStyle(
              //             fontWeight: FontWeight.bold,
              //             fontFamily: FontConstants.montserratFontFamily,
              //             fontSize: 14)),
              //     onPressed: () => Navigator.of(context).pop(),
              //     child: Text('ok'),
              //   ),
              // ],
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

//   static dynamic decodeJson(Response<dynamic> response) {
//     var responseJson = jsonDecode(response.data.toString());
//     return responseJson;
//   }
// }

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
}