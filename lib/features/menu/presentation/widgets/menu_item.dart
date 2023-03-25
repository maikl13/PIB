import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/resources/style_manager.dart';

class MenuViewItem extends StatelessWidget {
  const MenuViewItem({
    super.key,
    required this.icon,
    required this.title,
    required this.index,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final int index;
  final void Function()? onTap;

  Widget _buildLeading(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.0.w),
      child: Icon(
        icon,
        color: ColorManager.darkSeconadry,
        size: 16.sp,
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      title,
      style: getRegularStyle(color: ColorManager.white, fontSize: 15.sp),
    );
  }

  Widget _buildTrailing(BuildContext context) {
    return Icon(
      Icons.arrow_forward,
      size: 16.sp,
      color: index == menuViewItemIcons.length - 1
          ? ColorManager.transparent
          : ColorManager.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 62.h,
        width: double.infinity,
        padding: EdgeInsets.only(right: 20.h, left: 25.w),
        decoration: BoxDecoration(
          color: ColorManager.black5,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            _buildLeading(context),
            SizedBox(width: 20.w),
            _buildTitle(),
            const Spacer(),
            _buildTrailing(context),
          ],
        ),
      ),
    );
  }
}
