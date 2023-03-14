import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/style_manager.dart';

import '../resources/utils.dart';

class DefaultPhoneTextField extends StatelessWidget {
  const DefaultPhoneTextField(
      {super.key,
      this.suffix,
      this.hint,
      this.contentPadding,
      this.validator,
      this.onSaved,
      this.prefixIcon,
      this.controller});

  final Widget? suffix;
  final String? hint;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final IconData? prefixIcon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: ColorManager.lightSeconadary,
      style: getBoldStyle(fontSize: 20.sp, color: ColorManager.darkGrey),
      onSaved: onSaved,
      validator: validator,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        label: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(AppStrings.phoneNumber,
                style: getBoldStyle(
                    fontSize: 10.sp, color: ColorManager.darkGrey)),
            const SizedBox(height: 10),
            Text(AppStrings.zeros,
                style:
                    getRegularStyle(fontSize: 17.sp, color: ColorManager.grey)),
          ],
        ),

        prefixIcon: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              prefixIcon ?? Icons.phone,
              color: ColorManager.lightSeconadary,
              size: 20.sp,
            ),
          ],
        ),
        contentPadding: contentPadding ??
            EdgeInsets.only(top: 28.h, bottom: 18.h, right: 20.w),
        hintText: hint ?? AppStrings.zeros,
        // hintStyle: ,
        suffixIcon: Padding(
          padding: EdgeInsets.only(top: 0.h, left: 20.w, bottom: 28.h),
          child: suffix ??
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Text(
                  '${getCountryFlag()}    ${AppStrings.countryCode}',
                  style:
                      getBoldStyle(color: ColorManager.grey, fontSize: 17.sp),
                ),
              ),
        ),
      ),
    );
  }
}
