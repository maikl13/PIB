import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/assets_manager.dart';
import 'package:pip/core/resources/color_manager.dart';
import 'package:pip/core/resources/strings_manager.dart';
import 'package:pip/core/widgets/custom_appbar.dart';

import '../../../../core/resources/style_manager.dart';

class WorkWithUsView extends StatelessWidget {
  const WorkWithUsView({super.key});
  _buildBody() {
    return Padding(
      padding: EdgeInsets.only(top: 70.h, right: 20.w, left: 20.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildLogo(),
            SizedBox(height: 60.h),
            _buildCopyContainer(),
          ],
        ),
      ),
    );
  }

  _buildLogo() {
    return Image.asset(
      ImageAssets.authLogo,
      height: 274.h,
    );
  }

  _buildCopyContainer() {
    return Container(
      width: double.infinity,
      height: 213.h,
      decoration: BoxDecoration(
        color: ColorManager.darkSeconadry,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTitle(),
          SizedBox(height: 18.h),
          _buildDescription(),
          SizedBox(height: 39.h),
          _buildCopy(),
        ],
      ),
    );
  }

  _buildTitle() {
    return Text(
      AppStrings.welcome,
      style: getBoldStyle(fontSize: 20.sp, color: ColorManager.white),
    );
  }

  _buildDescription() {
    return Text(
      AppStrings.yourSpecialNub,
      style: getRegularStyle(fontSize: 14.sp, color: ColorManager.white),
    );
  }

  _buildCopy() {
    return Padding(
      padding: EdgeInsets.only(right: 30.w, left: 30.w),
      child: Container(
        width: double.infinity,
        height: 57.h,
        decoration: BoxDecoration(
          color: ColorManager.lightBlack,
          borderRadius: BorderRadius.circular(28.r),
        ),
        child: Padding(
          padding: EdgeInsets.only(right: 40.w, left: 40.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCopyText(),
              _buildCopyIcon(),
            ],
          ),
        ),
      ),
    );
  }

  _buildCopyText() {
    return Text(
      '12323425',
      style: getBoldStyle(fontSize: 20.sp, color: ColorManager.darkSeconadry),
    );
  }

  _buildCopyIcon() {
    return Icon(
      Icons.copy,
      color: ColorManager.darkSeconadry,
      size: 20.sp,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarColor: ColorManager.lightBlack,
        title: AppStrings.workAs,
        actions: const [],
      ),
      body: _buildBody(),
    );
  }
}
