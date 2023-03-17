import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/color_manager.dart';
import 'package:pip/core/resources/style_manager.dart';

class ContactUsInfoItem extends StatelessWidget {
  const ContactUsInfoItem({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;

  _buildIcon() {
    return SizedBox(
      // width: 35.w,
      height: 35.h,
      child: CircleAvatar(
        backgroundColor: ColorManager.darkSeconadry,
        child: Icon(
          icon,
          color: Colors.white,
          size: 15.sp,
        ),
      ),
    );
  }

  _buildTitle() {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w),
      child: Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          title,
          style: getBoldStyle(fontSize: 15.sp, color: ColorManager.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 163.w,
      height: 109.h,
      decoration: BoxDecoration(
        color: ColorManager.black5,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        _buildIcon(),
        SizedBox(height: 20.h),
        _buildTitle(),
      ]),
    );
  }
}