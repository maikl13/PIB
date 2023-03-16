import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/style_manager.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key, this.fillColor, this.onChanged, this.controller});

  final Color? fillColor;
  final void Function(String)? onChanged;
  final TextEditingController? controller;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
        style: getBoldStyle(fontSize: 14.sp, color: ColorManager.darkSeconadry),
        cursorColor: ColorManager.darkSeconadry,
        decoration: InputDecoration(
          fillColor: fillColor,
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.transparent, width: 1.5.w),
              borderRadius: BorderRadius.all(Radius.circular(26.r))),
          errorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.transparent, width: 1.5.sp),
              borderRadius: BorderRadius.all(Radius.circular(26.r))),
          focusedErrorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.transparent, width: 1.5.sp),
              borderRadius: BorderRadius.all(Radius.circular(26.r))),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(26.r),
            borderSide: BorderSide(
              color: ColorManager.transparent,
              // width: 1.w,
            ),
          ),
          contentPadding: EdgeInsets.only(top: 12.h, bottom: 11.h, right: 20.w),
          hintText: AppStrings.search,
          suffixIcon: Padding(
            padding: EdgeInsets.only(top: 0.h, left: 20.w),
            child: Icon(
              Icons.search,
              color: ColorManager.darkSeconadry,
              size: 20.sp,
            ),
          ),
        ));
  }
}
