import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/color_manager.dart';
import 'package:pip/core/resources/style_manager.dart';

class MainInfoItem extends StatelessWidget {
  const MainInfoItem({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;
  _buildIcon() {
    return Icon(
      icon,
      color: ColorManager.darkSeconadry,
      size: 17.sp,
    );
  }

  _buildTitle() {
    return Text(title,
        style: getRegularStyle(fontSize: 13.sp, color: ColorManager.grey));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildIcon(),
        SizedBox(height: 15.h),
        _buildTitle(),
      ],
    );
  }
}
