import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/assets_manager.dart';
import 'package:pip/core/resources/color_manager.dart';
import 'package:pip/core/resources/strings_manager.dart';
import 'package:pip/core/resources/style_manager.dart';

class ChatsItem extends StatelessWidget {
  const ChatsItem({super.key});
  _buildBackground() {
    return Image.asset(
      ImageAssets.flibBackground,
      fit: BoxFit.fill,
    );
  }

  Widget _buildAvatar() {
    return SizedBox(
        height: 60.h,
        width: 60.w,
        child: CircleAvatar(
          radius: 80.r,
          backgroundImage: const AssetImage(ImageAssets.banner),
        ));
  }

  _buildTitle() {
    return Text(
      AppStrings.userName,
      style: getBoldStyle(fontSize: 18.sp, color: ColorManager.darkSeconadry),
    );
  }

  _buildSubtitle() {
    return Text(
      'السلام عليكم',
      style: getRegularStyle(fontSize: 12.sp, color: ColorManager.darkGrey),
    );
  }

  _buildArrow() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "01 : 30",
            style: getRegularStyle(fontSize: 11.sp, color: ColorManager.grey),
          ),
          Icon(
            Icons.arrow_forward,
            color: ColorManager.darkSeconadry,
            size: 16.sp,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildBackground(),
            Padding(
              padding: EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAvatar(),
                  SizedBox(width: 20.w),
                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTitle(),
                        SizedBox(height: 10.sp),
                        _buildSubtitle(),
                      ],
                    ),
                  ),
                  const Spacer(),
                  _buildArrow(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
