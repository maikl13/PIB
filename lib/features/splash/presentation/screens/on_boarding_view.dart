import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';

import '../../../../core/resources/route_manager.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  _buildBody(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _buildBackground(),
        _buildContent(context),
      ],
    );
  }

  _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 60.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildHeadline(),
          SizedBox(height: 23.h),
          _buildSubHeadline(),
          SizedBox(height: 40.h),
          _buildButton(context),
        ],
      ),
    );
  }

  _buildBackground() {
    return Image.asset(
      ImageAssets.onBoarding,
      fit: BoxFit.cover,
    );
  }

  _buildHeadline() {
    return Text(
      AppStrings.onBoardingHeadline,
      style: getBoldStyle(
        color: ColorManager.white,
        fontSize: 28.sp,
      ),
    );
  }

  _buildSubHeadline() {
    return Padding(
      padding: EdgeInsets.only(right: 65.w, left: 65.w),
      child: Text(
        textAlign: TextAlign.center,
        AppStrings.onBoardingSubHeadline,
        style: getRegularStyle(
          color: ColorManager.white.withOpacity(.8),
          fontSize: 14.sp,
        ),
      ),
    );
  }

  _buildButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, Routes.mainAuthViewRoute);
      },
      child: Container(
        width: 190.w,
        height: 55.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorManager.darkSeconadry,
              ColorManager.lightSeconadary,
            ],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
          borderRadius: BorderRadius.circular(31.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTitle(),
            SizedBox(width: 30.w),
            _buildIcon(context),
          ],
        ),
      ),
    );
  }

  _buildTitle() {
    return Padding(
      padding: EdgeInsets.only(right: 70.w),
      child: Text(
        AppStrings.start,
        style: getBoldStyle(
          color: ColorManager.white,
          fontSize: 20.sp,
        ),
      ),
    );
  }

  _buildIcon(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.w, top: 5.h, bottom: 5.h),
      child: CircleAvatar(
        backgroundColor: ColorManager.white,
        radius: 25.r,
        child: Icon(
          Icons.arrow_forward,
          color: ColorManager.lightSeconadary,
          size: 15.sp,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }
}
