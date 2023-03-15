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
        backgroundColor: ColorManager.transparent,
        length: 6,
        textStyle: getBoldStyle(color: ColorManager.black, fontSize: 25.sp),
        cursorColor: ColorManager.black,
        obscureText: false,
        animationType: AnimationType.fade,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        keyboardType: TextInputType.number,
        pinTheme: PinTheme(
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
