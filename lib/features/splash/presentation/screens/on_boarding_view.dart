import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/assets_manager.dart';
import 'package:pip/core/resources/color_manager.dart';
import 'package:pip/core/resources/strings_manager.dart';
import 'package:pip/core/resources/style_manager.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  _buildBody() {
    return Stack(
      fit: StackFit.expand,
      children: [
        _buildBackground(),
        _buildContent(),
      ],
    );
  }

  _buildContent() {
    return Padding(
      padding: EdgeInsets.only(bottom: 60.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildHeadline(),
          SizedBox(height: 23.h),
          _buildSubHeadline(),
          SizedBox(height: 40.h),
          _buildButton(),
        ],
      ),
    );
  }

  _buildBackground() {
    return Image.asset(
      ImageAssets.onBoarding,
      fit: BoxFit.fill,
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

  _buildButton() {
    return Container(
      width: 190.w,
      height: 55.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorManager.lightSeconadary,
            ColorManager.darkSeconadary,
          ],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
        borderRadius: BorderRadius.circular(31.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(right: 76.w),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTitle(),
            SizedBox(width: 30.w),
            _buildIcon(),
          ],
        ),
      ),
    );
  }

  _buildTitle() {
    return Text(
      AppStrings.start,
      style: getBoldStyle(
        color: ColorManager.white,
        fontSize: 20.sp,
      ),
    );
  }

  _buildIcon() {
    return Container(
      width: 45.w,
      height: 45.h,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Icon(
        Icons.arrow_back,
        color: ColorManager.darkSeconadary,
        size: 20.sp,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }
}
