import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/assets_manager.dart';
import 'package:pip/core/resources/color_manager.dart';
import 'package:pip/core/resources/strings_manager.dart';
import 'package:pip/core/resources/style_manager.dart';

class JobItem extends StatelessWidget {
  const JobItem({super.key});


  _buildImage() {
    return Stack(
      // fit: StackFit.loose,
      children: [
        SizedBox(
          width: 80.w,
          height: 70.h,
          // color: Colors.amber,
        ),
        _buildJobImage(),
        _buildJobRate(),
      ],
    );
  }

  _buildJobImage() {
    return SizedBox(
      width: 70.w,
      height: 70.h,
      // color: Colors.red,
      child: ClipOval(
          child: Image.asset(
        ImageAssets.banner,
        height: 70.h,
        width: 70.w,
        fit: BoxFit.fill,
      )),
    );
  }

  _buildJobRate() {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          width: 49.w,
          height: 19.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r), color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '04',
                style: TextStyle(fontSize: 10.sp),
              ),
              SizedBox(
                width: 5.w,
              ),
              Icon(
                Icons.star,
                color: ColorManager.darkSeconadry,
                size: 11.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildCompanyName() {
    return Text(
     AppStrings.companyName,
      style: getBoldStyle(fontSize: 12.sp, color: ColorManager.white),
    );
  }

  _buildJobtitle() {
    return Text(
      AppStrings.jobTitle,
      style: getBoldStyle(fontSize: 12.sp, color: ColorManager.grey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildImage(),
        SizedBox(height: 10.h),
        _buildCompanyName(),
        SizedBox(height: 6.h),
        _buildJobtitle(),
      ],
    );
  }
}
