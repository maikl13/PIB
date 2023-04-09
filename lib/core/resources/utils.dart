import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../business_logic/global_cubit.dart';
import '../business_logic/global_state.dart';
import 'commons.dart';
import 'style_manager.dart';
import '../web_services/api_result.dart';
import '../widgets/notification_warning.dart';
import 'assets_manager.dart';
import 'color_manager.dart';
import 'route_manager.dart';

import 'constants.dart';

String getStatusInArabic(String status) {
  if (status == 'active') {
    return 'متاح ل تلقي العروض';
  } else if (status == 'pending') {
    return 'في انتظار الموافقة';
  } else if (status == 'complete') {
    return 'تم انهاء الطلب';
  } else if (status == 'canceled') {
    return 'ملغي';
  } else if (status == 'rejected') {
    return 'مرفوض';
  } else if (status == 'accepted') {
    return 'مقبول';
  } else if (status == 'processing') {
    return 'قيد التنفيذ';
  } else if (status == 'processing') {
    return 'قيد التنفيذ';
  } else if (status == 'closed') {
    return 'تم الغاء الطلب';
  } 
  
  else {
    return status;
  }
}

bool containEnglishLetter(String text) {
  // String str = "Hello World!Z";
  RegExp englishLetterPattern = RegExp(r'[a-zA-Z]$');
  bool endsWithEnglishLetter =
      englishLetterPattern.hasMatch(text[text.length - 1]);
  return endsWithEnglishLetter;
}

String formatDate(String dateString) {
  DateTime date = DateTime.parse(dateString);
  int day = date.day;
  int month = date.month;
  int year = date.year;
  return '$day-$month-$year';
}

String? validateMobile(String value) {
  if (value.isEmpty) {
    return 'من فضلك ادخل رقم الهاتف';
  }
// Indian Mobile number are of 10 digit only
  else if (value.length > 15 || value.length < 7) {
    return 'برجاء ادخال رقم هاتف صحيح';
  } else {
    return null;
  }
}

String getCountryFlag() {
  String countryCode = 'sa';
  String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
      (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
  return flag;
}

defaultAppBar(BuildContext context) {
  return AppBar(
    // backwardsCompatibility: false,
    automaticallyImplyLeading: false,
    backgroundColor: ColorManager.lightBlack,
    titleSpacing: 0,

    centerTitle: false,
    title: buildMainSearchViewAppBarTitle(context),
    actions: buildMainSearchViewAppBarActions(context),
  );
}

bool checkUserType(BuildContext context) {
  if (isAnonymous == true) {
    Commons.showErrorDialog(
        context, 'يجب تسجيل الدخول اولا للوصول الى هذه الخدمة');
    return true;
  } else {
    return false;
  }
}

buildMainSearchViewAppBarTitle(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(right: 20.w),
    child: Text(
      viewsTitles[screenIndex],
      style:  getBoldStyle(fontSize: 22.sp, color: ColorManager.white) ,
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
            child: Padding(
              padding: EdgeInsets.only(top: 22.h),
              child: Stack(
                children: [
                  Image.asset(
                    ImageAssets.notification,
                    width: 20.h,
                    height: 20.h,
                    fit: BoxFit.contain,
                  ),
                  BlocConsumer<GlobalCubit, GlobalState>(
                    listener: (context, state) {},
                    buildWhen: (previous, current) =>
                        current is GetUnreadNotificationCountSuccess ||
                        current is Success,
                    builder: (context, state) {
                      return Visibility(
                        visible: state.maybeWhen(
                          getUnreadNotificationCountSuccess: (count) {
                            return count != 0
                                ? true
                                : false;
                          },
                          orElse: () => false,
                        ),
                        child: const NotificationWarning(),
                      );
                    },
                  )
                ],
              ),
            )))
  ];
}

String mapStyles = '''[
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ffffff"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dadada"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#c9c9c9"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  }
]''';
