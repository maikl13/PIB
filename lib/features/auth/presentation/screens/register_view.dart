import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/color_manager.dart';
import 'package:pip/core/resources/commons.dart';
import 'package:pip/core/resources/route_manager.dart';
import 'package:pip/core/widgets/custom_appbar.dart';
import 'package:pip/core/widgets/default_textfield.dart';
import 'package:pip/features/auth/presentation/widgets/custom_bottom_phrase.dart';
import 'package:pip/features/auth/presentation/widgets/custom_hint_text.dart';

import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../../core/widgets/default_phone_textfield.dart';
import '../../../../core/widgets/headline.dart';
import '../../../../core/widgets/sub_headline.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  Widget _buildBody(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding:
          EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w, bottom: 20.h),
      children: [
        const CustomHeadline(title: AppStrings.registerNewAcc),
        SizedBox(height: 15.h),
        const CustomSubHeadLine(title: AppStrings.registerDescription),
        SizedBox(height: 40.h),
        _buildNameTextField(),
        SizedBox(height: 20.h),
        const DefaultPhoneTextField(),
        SizedBox(height: 20.h),
        _buildPasswordTextField(),
        SizedBox(height: 100.h),
        _buildButton(context),
        SizedBox(height: 22.h),
        const Center(
            child: CustomHintText(title: AppStrings.termsAndCondition)),
        // const Spacer(),
        SizedBox(height: 85.h),

        CustomBottomPhrase(
          text1: AppStrings.areadyHaveAnaccount,
          text2: AppStrings.login,
          onPressed: () {
            Navigator.pushNamed(context, Routes.loginViewRoute);
          },
        ),
      ],
    );
  }

  _buildNameTextField() {
    return DefaultTextField(
      hint: AppStrings.name,
      prefix: Icon(
        Icons.person,
        color: ColorManager.darkSeconadry,
        size: 20.sp,
      ),
    );
  }

  _buildPasswordTextField() {
    return DefaultTextField(
        prefix: Icon(
          Icons.lock,
          color: ColorManager.darkSeconadry,
          size: 20.sp,
        ),
        hint: AppStrings.password);
  }

  _buildButton(BuildContext context) {
    return DefaultButton(
      text: AppStrings.registerNewAcc,
      onTap: () {
        showSuccessDialog(context);
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
