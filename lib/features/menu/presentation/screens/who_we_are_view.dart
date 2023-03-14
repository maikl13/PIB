import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/assets_manager.dart';
import 'package:pip/core/resources/color_manager.dart';
import 'package:pip/core/resources/strings_manager.dart';
import 'package:pip/core/resources/style_manager.dart';
import 'package:pip/core/widgets/custom_appbar.dart';

class WhoWeAreView extends StatelessWidget {
  const WhoWeAreView({super.key});

  _buildLogo() {
    return Image.asset(
      ImageAssets.splashLogo,
      width: 88.w,
      height: 60.h,
    );
  }

  _buildBody() {
    return Padding(
      padding: EdgeInsets.only(top: 50.h, right: 20.w, left: 20.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildLogo(),
            SizedBox(height: 15.h),
            _buildTitle(),
            SizedBox(height: 15.h),
            _buildDescription(),
            SizedBox(height: 15.h),
            _buildSubTitle(),
            SizedBox(height: 15.h),
            _buildDescription(),
          ],
        ),
      ),
    );
  }

  _buildSubTitle() {
    return Text(
      AppStrings.defaText,
      maxLines: 1,
      overflow: TextOverflow.clip,
      style: getRegularStyle(
          fontSize: 13.sp, color: ColorManager.darkSeconadry.withOpacity(.6)),
    );
  }

  _buildDescription() {
    return Text(
      textAlign: TextAlign.center,
      AppStrings.defaText,
      style: getRegularStyle(
              fontSize: 13.sp, color: ColorManager.white.withOpacity(.6))
          .copyWith(height: 2),
    );
  }

  _buildTitle() {
    return Text('Who we are',
        style:
            getBoldStyle(fontSize: 18.sp, color: ColorManager.darkSeconadry));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarColor: ColorManager.lightBlack,
        title: 'Who we are',
        actions: const [],
      ),
      body: _buildBody(),
    );
  }
}
