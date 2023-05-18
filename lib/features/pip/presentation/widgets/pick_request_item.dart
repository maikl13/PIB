import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';

class PickRequestItem extends StatelessWidget {
  const PickRequestItem(
      {super.key,
      required this.title,
      this.description,
      this.height,
      this.onTap});
  final String title;
  final String? description;
  final double? height;
  final void Function()? onTap;

  _buildLeading() {
    return Padding(
      padding: EdgeInsets.only(top: 30.h),
      child: Container(
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
            color: ColorManager.darkSeconadry, shape: BoxShape.circle
            // borderRadius: BorderRadius.circular(25.r),
            ),
        child: Center(
          child: Text(
            AppStrings.pib,
            style: getBoldStyle(fontSize: 16.sp, color: ColorManager.white),
          ),
        ),
      ),
    );
  }

  _buildTitle() {
    return Text(
      title,
      style: getBoldStyle(fontSize: 18.sp, color: ColorManager.darkSeconadry),
    );
  }

  _buildDescription() {
    return Text(
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      description ?? AppStrings.requestDescription,
      style: getRegularStyle(fontSize: 12.sp, color: ColorManager.darkGrey),
    );
  }

  _buildTrailing() {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Image.asset(
        ImageAssets.rightArrow,
        width: 16.w,
        height: 16.h,
        color: ColorManager.darkSeconadry,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: height ?? 127.h,
        decoration: BoxDecoration(
          color: ColorManager.lightBlack,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.only(right: 15.w, left: 15.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLeading(),
              SizedBox(width: 15.w),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: SizedBox(
                  width: 220.w,
                  // height: 82.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTitle(),
                      SizedBox(height: 10.h),
                      _buildDescription(),
                    ],
                  ),
                ),
              ),
              _buildTrailing(),
            ],
          ),
        ),
      ),
    );
  }
}
