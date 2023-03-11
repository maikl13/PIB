import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import 'clock_date.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  _buildLeading(BuildContext context) {
    return Container(
      // alignment: Alignment.,
      width: 50.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: ColorManager.darkSeconadry,
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        ImageAssets.bell,
      ),
    );
  }

  _buildTitle() {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Text(
        AppStrings.notificationSubtitle,
        style: getRegularStyle(color: ColorManager.darkGrey, fontSize: 12.sp),
      ),
    );
  }

  _buildSubTitle() {
    return ClockDate(
      color: ColorManager.grey,
    );
  }

  _buildTrailing() {
    return Padding(
      padding: EdgeInsets.only(top: 55.h),
      child: Icon(
        Icons.arrow_forward,
        color: ColorManager.darkSeconadry,
        size: 16.sp,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 117.h,
      width: double.infinity,
      child: ListTile(
        tileColor: ColorManager.lightBlack,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        contentPadding: EdgeInsets.only(top: 10.h, right: 20.w, left: 20.w),
        dense: true,
        leading: _buildLeading(context),
        title: _buildTitle(),
        subtitle: _buildSubTitle(),
        trailing: _buildTrailing(),
      ),
    );
  }
}
