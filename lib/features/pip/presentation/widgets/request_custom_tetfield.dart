import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/assets_manager.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/default_textfield.dart';

class RequestCustomTextField extends StatelessWidget {
  const RequestCustomTextField(
      {super.key,
      this.hint,
      required this.icon,
      this.suffix,
      this.maxLines,
      this.controller,
      this.contentPadding,
      this.bottomPadding,
      this.hintStyle,
      this.validator,
      this.topPadding,
      this.floatingLabelBehavior,
      this.label,
      this.circleAvatar = false});
  final String? hint;
  final String? icon;
  final Widget? suffix;
  final int? maxLines;
  final TextEditingController? controller;
  final EdgeInsets? contentPadding;
  final double? bottomPadding;
  final double? topPadding;
  final TextStyle? hintStyle;
  final String? Function(String?)? validator;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Widget? label;
  final bool? circleAvatar;
  @override
  Widget build(BuildContext context) {
    return DefaultTextField(
      floatingLabelBehavior: floatingLabelBehavior,
      label: label,
      validator: validator,
      controller: controller,
      hintStyle:
          hintStyle ?? getBoldStyle(fontSize: 15.sp, color: ColorManager.grey5),
      maxLines: maxLines,
      style: getBoldStyle(fontSize: 18.sp, color: ColorManager.darkGrey),
      hint: hint,
      contentPadding:
          contentPadding ?? EdgeInsets.only(top: 15.h, bottom: 15.h),
      suffix: suffix,
      prefix: Padding(
        padding: EdgeInsets.only(
            right: 15.w,
            left: 20.w,
            bottom: bottomPadding ?? 0,
            top: topPadding ?? 0),
        child: SizedBox(
          width: 35.w,
          height: 35.h,
          child: circleAvatar!
              ? SizedBox(
                  width: 18.w,
                  height: 18.h,
                  child: Image.asset(ImageAssets.title,
                      width: 18.w,
                      height: 18.h,
                      fit: BoxFit.scaleDown,
                      color: ColorManager.darkSeconadry),
                )
              : CircleAvatar(
                  radius: 25.r,
                  backgroundColor: ColorManager.darkSeconadry,
                  child: Image.asset(
                    icon!,
                    width: 18.w,
                    height: 18.h,
                    color: ColorManager.white,
                  ),
                ),
        ),
      ),
    );
  }
}
