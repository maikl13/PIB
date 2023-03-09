import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/assets_manager.dart';
import 'package:pip/core/resources/color_manager.dart';
import 'package:pip/core/resources/route_manager.dart';
import 'package:pip/core/resources/strings_manager.dart';
import 'package:pip/core/widgets/dark_default_button.dart';
import 'package:pip/core/widgets/default_button.dart';
import 'package:pip/core/widgets/skip_text.dart';
import 'package:pip/features/auth/presentation/widgets/main_auth_headline.dart';
import 'package:pip/features/auth/presentation/widgets/social_button.dart';

import '../../../../core/resources/style_manager.dart';

class MainAuthView extends StatelessWidget {
  const MainAuthView({super.key});

  _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MainAuthHeadline(),
          _buildLogo(),
          SizedBox(height: 50.h),
          DefaultButton(
            text: AppStrings.registerNewAcc,
            onTap: () {
              Navigator.pushNamed(context, Routes.registerViewRoute);
            },
          ),
          SizedBox(height: 25.h),
          DarkDefaultButton(
            text: AppStrings.login,
            onTap: () {
              Navigator.pushNamed(context, Routes.loginViewRoute);
            },
          ),
          SizedBox(height: 76.h),
          _buildOrLoginWith(),
          SizedBox(height: 29.h),
          _buildSocialButtons(),
        ],
      ),
    );
  }

  _buildLogo() {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w),
      child: Image.asset(
        ImageAssets.authLogo,
        width: 294.66.w,
        height: 273.66.h,
        fit: BoxFit.fill,
      ),
    );
  }

  _buildOrLoginWith() {
    return Center(
      child: Text(AppStrings.orLoginWith,
          style: getBoldStyle(
            color: ColorManager.grey,
            fontSize: 14.sp,
          )),
    );
  }

  _buildSocialButtons() {
    return Row(
      children: const [
        SocialButton(
          icon: ImageAssets.facebook,
          title: AppStrings.facebook,
        ),
        SocialButton(
          icon: ImageAssets.google,
          title: AppStrings.login,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.transparent,
        actions: const [
          SkipText(),
        ],
      ),
      body: _buildBody(context),
    );
  }
}
