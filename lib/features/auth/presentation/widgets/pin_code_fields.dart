import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';

class CustomPinCodeFields extends StatelessWidget {
  const CustomPinCodeFields({super.key, this.onCompleted, this.onChanged});

  final void Function(String)? onCompleted;
  final void Function(String)? onChanged;

  Widget _buildPinCodeFields(context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        errorTextMargin: EdgeInsets.only(top: 20.h, bottom: 80.h),
        scrollPadding: EdgeInsets.zero,
        // errorTextMargin: EdgeInsets.only(top: 80.h),
        autoFocus: true,
        enablePinAutofill: true,
        autoDismissKeyboard: true,
        autoUnfocus: true,
        backgroundColor: ColorManager.transparent,
        length: 6,

        textStyle:
            getBoldStyle(color: ColorManager.black, fontSize: 24.sp).copyWith(),
        cursorColor: ColorManager.black,
        obscureText: false,

        animationType: AnimationType.fade,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        keyboardType: TextInputType.number,
        pinTheme: PinTheme(
          // fieldOuterPadding: EdgeInsets.zero,
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(15.r),
          fieldHeight: 55.h,
          fieldWidth: 52.w,

          // fieldOuterPadding: EdgeInsets.only(left: 1.w, right: 5.w),
          selectedColor: ColorManager.transparent,
          disabledColor: ColorManager.transparent,
          activeColor: ColorManager.transparent,
          activeFillColor: ColorManager.darkSeconadry,
          selectedFillColor: ColorManager.darkGrey,
          inactiveColor: ColorManager.transparent,
          inactiveFillColor: ColorManager.darkGrey,
        ),
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        onCompleted: onCompleted,
        onChanged: onChanged!,
        beforeTextPaste: (text) {
          return true;
        },
        appContext: context,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildPinCodeFields(context);
  }
}
