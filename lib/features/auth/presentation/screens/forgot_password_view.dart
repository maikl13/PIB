import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/strings_manager.dart';
import 'package:pip/core/widgets/custom_appbar.dart';
import 'package:pip/core/widgets/default_button.dart';
import 'package:pip/core/widgets/default_phone_textfield.dart';
import 'package:pip/core/widgets/headline.dart';
import 'package:pip/core/widgets/sub_headline.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomHeadline(title: AppStrings.forgotPassword),
          SizedBox(height: 15.h),
          const CustomSubHeadLine(title: AppStrings.forgotPasswordDescription),
          SizedBox(height: 40.h),
          const DefaultPhoneTextField(),
          SizedBox(height: 150.h),
          const DefaultButton(text: AppStrings.send),
        ],
      ),
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
