import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/assets_manager.dart';
import '../resources/shared_prefrences.dart';
import '../resources/utils.dart';
import '../resources/color_manager.dart';
import '../resources/constants.dart';
import '../resources/strings_manager.dart';
import '../resources/style_manager.dart';

import 'codes.dart';
import 'country_picker.dart';

class DefaultPhoneTextField extends StatefulWidget {
  const DefaultPhoneTextField(
      {super.key,
        this.suffix,
        this.hint,
        this.contentPadding,
        this.validator,
        this.onSaved,
        this.controller,
        this.initialValue});

  final Widget? suffix;
  final String? hint;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final String? initialValue;

  @override
  State<DefaultPhoneTextField> createState() => _DefaultPhoneTextFieldState();
}

class _DefaultPhoneTextFieldState extends State<DefaultPhoneTextField> {

  TextEditingController nameTextEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    nameTextEditingController.addListener(_hasStartedTyping);
  }

  void _hasStartedTyping() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // textAlign: TextAlign.justify,
      textAlignVertical: TextAlignVertical.bottom,
      initialValue: widget.initialValue,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp("[0-9]"),
        ),
      ],
      onTap: () {
        if (widget.controller!.selection ==
            TextSelection.fromPosition(
                TextPosition(offset: widget.controller!.text.length - 1))) {
          setState(() {
            widget.controller!.selection = TextSelection.fromPosition(
                TextPosition(offset: widget.controller!.text.length));
          });
        }
      },

      controller: widget.controller,
      cursorColor: ColorManager.lightSeconadary,
      style: getBoldStyle(fontSize: 16.sp, color: ColorManager.darkGrey),
      onSaved: widget.onSaved,
      // maxLines: 2,
      onChanged: (value) {
        // setState(() {
        //   if (value.isNotEmpty) {
        //     _labelText = 'Name';
        //   } else {
        //     _labelText = 'null';
        //   }
        // });
      },
      validator: widget.validator ??
              (value) {
            return validateMobile(value!);
          },

      decoration: InputDecoration(
        // alignLabelWithHint: true,

        floatingLabelBehavior: FloatingLabelBehavior.always,
        // labelText: _labelText,
        label: Padding(
          padding: EdgeInsets.only(
            top: 65.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                  widget.controller!.text == ""
                      ? AppStrings.phoneNumber
                      : AppStrings.phoneNumber,
                  style: getBoldStyle(
                      fontSize: 10.sp, color: ColorManager.darkGrey)),
              // SizedBox(height: 15.h),
              // Text(AppStrings.zeros,
              //     style: getRegularStyle(
              //         fontSize: 17.sp, color: ColorManager.grey)),
            ],
          ),
        ),

        isDense: true,
        // alignLabelWithHint: true,
        prefixIcon: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 11.h),
              child: Image.asset(ImageAssets.phone, height: 14.h, width: 14.w),
            ),
          ],
        ),

        contentPadding: EdgeInsets.only(top: 0.h, bottom: 17.h, right: 8.w),
        hintText: widget.hint ?? AppStrings.zeros,
        hintStyle: getRegularStyle(fontSize: 17.sp, color: ColorManager.grey),
        suffixIcon: Padding(
            padding: EdgeInsets.only(left: 0.w, bottom: 22.h),
            child: widget.suffix ??
                CodePicker(
                    countryList:supported_codes,
                    // boxDecoration: BoxDecoration(color: ColorManager.error),
                    textStyle:
                    getBoldStyle(fontSize: 13.sp, color: ColorManager.white),
                    onChanged: (code) {
                      print(code.dialCode!);
                      countryCode = code.dialCode!;
                      CacheHelper.saveData(
                          key: 'countryCode', value: code.dialCode);
                    },
                    closeIcon: Icon(
                      Icons.close,
                      color: ColorManager.grey5,
                    ),
                    searchDecoration: InputDecoration(
                      hintText: AppStrings.search,

                      prefixIcon:  Icon(Icons.search , color: ColorManager.darkSeconadry,),
                      hintStyle: getRegularStyle(
                        fontSize: 15.sp,
                        color: ColorManager.grey,
                      ).copyWith(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                          color: ColorManager.grey,
                        ),
                      ),
                    ),
                    flagWidth: 22.w,
                    dialogTextStyle: getBoldStyle(
                        fontSize: 16.sp, color: ColorManager.grey),
                    showFlagMain: true,

                    boxDecoration: BoxDecoration(
                      color:  ColorManager.primary,
                      borderRadius: BorderRadius.circular(4.r),

                    ),
                    searchStyle: getRegularStyle(
                        fontSize: 15.sp, color: ColorManager.white),
                    initialSelection: countryCode,
                    favorite: const ['+966', 'SA'],
                    showCountryOnly: false,
                    showOnlyCountryWhenClosed: false,

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
