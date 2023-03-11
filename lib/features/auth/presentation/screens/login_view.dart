import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../../core/widgets/default_textfield.dart';
import '../../../../core/widgets/headline.dart';
import '../../../../core/widgets/sub_headline.dart';

import '../../../../core/resources/route_manager.dart';
import '../../../../core/widgets/default_phone_textfield.dart';
import '../widgets/custom_bottom_phrase.dart';
import '../widgets/custom_hint_text.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  _buildBody(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding:
          EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w, bottom: 20.h),
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
        _buildForgotPassword(context),
        // const Spacer(),
        SizedBox(height: 110.h),

        _buildBottomLoginHint(context),
      ],
    );
  }

  _buildForgotPassword(BuildContext context) {
    return Center(
      child: CustomHintText(
        title: AppStrings.forgotPassword,
        onPressed: () {
          Navigator.pushNamed(context, Routes.forgotPasswordViewRoute);
        },
      ),
    );
  }

  _buildPhoneTextField() {
    return const DefaultPhoneTextField(

        // hint: AppStrings.zeros,
        );
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

  _buildBottomLoginHint(BuildContext context) {
    return CustomBottomPhrase(
      text1: AppStrings.dontHaveAccount,
      text2: AppStrings.registerNewAcc,
      onPressed: () {
        Navigator.pushNamed(context, Routes.registerViewRoute);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: _buildBody(context),
    );
  }
}
