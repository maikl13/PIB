import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/color_manager.dart';
import 'package:pip/core/resources/strings_manager.dart';
import 'package:pip/core/resources/style_manager.dart';
import 'package:pip/core/widgets/custom_appbar.dart';
import 'package:pip/core/widgets/default_button.dart';
import 'package:pip/core/widgets/default_textfield.dart';
import 'package:pip/core/widgets/headline.dart';
import 'package:pip/core/widgets/sub_headline.dart';

import '../../../../core/resources/utils.dart';
import '../../../../core/widgets/default_phone_textfield.dart';
import '../../../../core/widgets/skip_text.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  _buildBody(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(right: 20.w, left: 20.w, top: 41.h, bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomHeadline(title: AppStrings.login),
          SizedBox(height: 15.h),
          const CustomSubHeadLine(title: AppStrings.loginDescription),
          SizedBox(height: 40.h),
          _buildPhoneTextField(),
          SizedBox(height: 20.h),
          _buildPasswordTextField(),
          SizedBox(height: 150.h),
          const DefaultButton(text: AppStrings.login),
          SizedBox(height: 27.h),
          _buildForgotPassword(),
          const Spacer(),
          _buildBottomLoginHint(),
        ],
      ),
    );
  }

  _buildForgotPassword() {
    return Center(
      child: TextButton(
        onPressed: () {},
        child: Text(
          AppStrings.forgotPassword,
          style: getRegularStyle(
              fontSize: 17.sp, color: ColorManager.darkSeconadry),
        ),
      ),
    );
  }

  _buildPhoneTextField() {
    return DefaultPhoneTextField(
        prefixIcon: Icons.phone,
        // hint: AppStrings.zeros,
        suffix: Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Text(
            '${getCountryFlag()}    ${AppStrings.countryCode}',
            style: getBoldStyle(color: ColorManager.grey, fontSize: 17.sp),
          ),
        ));
  }

  _buildPasswordTextField() {
    return DefaultTextField(
        prefix: Icon(
          Icons.lock,
          color: ColorManager.lightSeconadary,
          size: 20.sp,
        ),
        hint: AppStrings.password);
  }

  _buildBottomLoginHint() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.dontHaveAccount,
          style: getRegularStyle(fontSize: 12.sp, color: ColorManager.grey),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            AppStrings.registerNewAcc,
            style: getRegularStyle(
                    fontSize: 12.sp, color: ColorManager.darkSeconadry)
                .copyWith(decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        actions: [
          SkipText(),
        ],
      ),
      body: _buildBody(context),
    );
  }
}
