import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/constants.dart';
import '../resources/strings_manager.dart';
import '../resources/style_manager.dart';

import '../resources/utils.dart';
import 'country_picker.dart';

class DefaultPhoneTextField extends StatelessWidget {
  const DefaultPhoneTextField(
      {super.key,
      this.suffix,
      this.hint,
      this.contentPadding,
      this.validator,
      this.onSaved,
      this.controller});

  final Widget? suffix;
  final String? hint;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: ColorManager.lightSeconadary,
      style: getBoldStyle(fontSize: 20.sp, color: ColorManager.darkGrey),
      onSaved: onSaved,
      // maxLines: 2,
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

        isDense: true,

        contentPadding:
            EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w, bottom: 20.h),

        prefixIcon: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Image.asset(ImageAssets.phone, height: 16.h, width: 16.w),
            ),
          ],
        ),
        // contentPadding: contentPadding ??
        //     EdgeInsets.only(top: 28.h, bottom: 18.h, right: 20.w),
        hintText: hint ?? AppStrings.zeros,
        // hintStyle: ,
        suffixIcon: Padding(
            padding: EdgeInsets.only(left: 20.w, bottom: 20.h),
            child: suffix ??
                CodePicker(

                    // boxDecoration: BoxDecoration(color: ColorManager.error),
                    textStyle:
                        getBoldStyle(fontSize: 13.sp, color: ColorManager.grey),
                    onChanged: (code) {
                      countryCode = code.dialCode ?? '+966';
                      // print('countryCode: $countryCode');
                    },
                    closeIcon: Icon(
                      Icons.close,
                      color: ColorManager.grey5,
                    ),
                    searchDecoration: InputDecoration(
                      
                      hintText: AppStrings.search,
                      hintStyle: getRegularStyle(
                          fontSize: 15.sp, color: ColorManager.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                          color: ColorManager.grey,
                        ),
                      ),
                    ),
                    flagWidth: 22.w,
                    dialogTextStyle: getBoldStyle(
                        fontSize: 20.sp, color: ColorManager.grey5),
                    showFlagMain: true,
                    boxDecoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: ColorManager.grey,
                      ),
                    ),
                  
                    searchStyle: getRegularStyle(
                        fontSize: 15.sp, color: ColorManager.grey),
                    initialSelection: 'SA',
                    favorite: const ['+966', 'SA'],
                    showCountryOnly: false,
                    showOnlyCountryWhenClosed: false,
                    // countryFilter: const ['SA', 'EG'],
                    // padding: EdgeInsets.symmetric(horizontal: 16.w),
                    alignLeft: false)
            // Text(
            //   '${getCountryFlag()}    ${AppStrings.countryCode}',
            //   style: getBoldStyle(color: ColorManager.grey, fontSize: 13.sp),
            // ),
            ),
      ),
    );
  }
}
