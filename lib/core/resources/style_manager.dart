import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'strings_manager.dart';
import 'color_manager.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    
    fontSize: fontSize,
    fontFamily: FontConstants.defaultFontFamily,
    color: color,
    
    fontWeight: fontWeight,
    
  );
}

// regular style

TextStyle getRegularStyle({double fontSize = FontSize.s12, Color? color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.regular,
    color ?? ColorManager.primary,
  );
}

// medium style

TextStyle getMediumStyle({double fontSize = FontSize.s12, Color? color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.medium,
    color ?? ColorManager.primary,
  );
}

// light style

TextStyle getLightStyle({double fontSize = FontSize.s12, Color? color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.light,
    color ?? ColorManager.primary,
  );
}

// bold style

TextStyle getBoldStyle({double fontSize = FontSize.s12, Color? color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.bold,
    color ?? ColorManager.primary,
  );
}

// semibold style

TextStyle getSemiBoldStyle({double fontSize = FontSize.s12, Color? color}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.semiBold,
    color ?? ColorManager.primary,
  );
}

getdefaultTextFieldStyle(Widget suffix,{ void Function()? onTap}) {
  return InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(34.r),
      borderSide: const BorderSide(color: Color.fromRGBO(133, 133, 133, 0.26)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(34.r),
      borderSide: const BorderSide(color: Color.fromRGBO(133, 133, 133, 0.26)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(34.r),
      borderSide: const BorderSide(color: Color.fromRGBO(133, 133, 133, 0.26)),
    ),
    isDense: true,
    contentPadding: EdgeInsets.only(right: 25.w, left: 25.w, top: 25.h),
    fillColor: ColorManager.lightBlack,
    filled: true,
    prefixIcon: InkWell(
      onTap: onTap,
      child: Icon(
        Icons.camera_alt_outlined,
        color: ColorManager.darkGrey,
        size: 20.sp,
      ),
    ),
    suffixIcon: suffix,
    hintText: AppStrings.writeYourMessage,
    hintStyle: getRegularStyle(
        color: ColorManager.grey.withOpacity(.50), fontSize: 15.sp),
  );
}
