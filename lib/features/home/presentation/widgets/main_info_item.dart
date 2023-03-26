import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';

class MainInfoItem extends StatelessWidget {
  const MainInfoItem(
      {super.key, required this.title, required this.icon, this.iconSize});

  final String title;
  final String icon;
  final double? iconSize;
  _buildIcon() {
    return Image.asset(
      
      icon,
      width: iconSize ?? 18.5.w,
      height: iconSize ?? 18.5.h,
      color: ColorManager.darkSeconadry,
       
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
