import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/style_manager.dart';

import '../../../../core/resources/color_manager.dart';

class JobTypeItem extends StatelessWidget {
  const JobTypeItem({super.key});
  _buildIcon() {
    return SizedBox(
      width: 35.w,
      height: 35.h,
      child: CircleAvatar(
        radius: 25.r,
        backgroundColor: ColorManager.darkSeconadry,
        child: Icon(
          Icons.home,
          color: ColorManager.white,
          size: 18.sp,
        ),
      ),
    );
  }

  _buildTitle() {
    return Text(
      'Home',
      style: getBoldStyle(fontSize: 15.sp, color: ColorManager.grey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 109.h,
      width: 163.w,
      decoration: BoxDecoration(
        color: ColorManager.black5,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildIcon(),
          SizedBox(height: 18.h),
          _buildTitle(),
        ],
      ),
    );
  }
}
