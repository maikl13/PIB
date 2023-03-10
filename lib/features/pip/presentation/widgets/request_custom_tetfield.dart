import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/default_textfield.dart';

class RequestCustomTextField extends StatelessWidget {
  const RequestCustomTextField(
      {super.key,
      this.hint,
      this.icon,
      this.suffix,
      this.maxLines,
      this.controller,
      this.contentPadding,
      this.bottomPadding,
      this.hintStyle});
  final String? hint;
  final IconData? icon;
  final Widget? suffix;
  final int? maxLines;
  final TextEditingController? controller;
  final EdgeInsets? contentPadding;
  final double? bottomPadding;
  final TextStyle? hintStyle;
  @override
  Widget build(BuildContext context) {
    return DefaultTextField(
      hintStyle:
          hintStyle ?? getBoldStyle(fontSize: 15.sp, color: ColorManager.grey5),
      maxLines: maxLines,
      style: getBoldStyle(fontSize: 22.sp, color: ColorManager.darkSeconadry),
      hint: hint,
      contentPadding:
          contentPadding ?? EdgeInsets.only(top: 15.h, bottom: 15.h),
      suffix: suffix,
      prefix: Padding(
        padding: EdgeInsets.only(
            right: 15.w, left: 20.w, bottom: bottomPadding ?? 0),
        child: SizedBox(
          width: 35.w,
          height: 35.h,
          child: CircleAvatar(
            radius: 25.r,
            backgroundColor: ColorManager.darkSeconadry,
            child: Icon(
              icon,
              color: ColorManager.white,
              size: 18.sp,
            ),
          ),
        ),
      ),
    );
  }
}
