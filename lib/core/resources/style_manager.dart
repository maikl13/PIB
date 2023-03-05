import 'package:flutter/material.dart';
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
