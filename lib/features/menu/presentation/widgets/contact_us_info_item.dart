import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';

class ContactUsInfoItem extends StatelessWidget {
  const ContactUsInfoItem(
      {super.key, this.icon, required this.title, this.onTap, this.widget});
  final String? icon;
  final String title;
  final void Function()? onTap;
  final Widget? widget;

  _buildIcon() {
    return SizedBox(
      // width: 35.w,
      height: 35.h,
      child: CircleAvatar(
        backgroundColor: ColorManager.darkSeconadry,
        child: widget ??
            Image.asset(
              icon ?? ImageAssets.phone,
              fit: BoxFit.scaleDown,
              width: 15.w,
              height: 15.h,
              color: ColorManager.white,
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
    return InkWell(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}
