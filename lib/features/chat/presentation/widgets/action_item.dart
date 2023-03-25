import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';

import '../../../../core/resources/style_manager.dart';

class ActionItem extends StatelessWidget {
  const ActionItem({super.key, required this.icon, required this.title,  this.onTap});

  final IconData icon;
  final String title;
  final void Function()? onTap;
  _buildIcon() {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 40.w,
        height: 40.h,
        child: CircleAvatar(
          backgroundColor: ColorManager.darkSeconadry,
          child: Center(
            child: Icon(
              icon,
              color: ColorManager.white,
            ),
          ),
        ),
      ),
    );
  }

  _buildTitle() {
    return Text(
     title,
      style: getRegularStyle(fontSize: 12.sp, color: ColorManager.grey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildIcon(),
        SizedBox(height: 20.h),
        _buildTitle(),
      ],
    );
  }
}
