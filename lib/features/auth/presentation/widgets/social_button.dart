import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';

import '../../../../core/widgets/dark_default_button.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.icon, required this.title, this.onTap});
  final String icon;
  final String title;
  final void Function()? onTap;

  _buildIcon() {
    return Image.asset(
      icon,
      width: 17.w,
      height: 17.h,
    );
  }

  _buildTitle() {
    return Text(
      title,
      style: getBoldStyle(
        fontSize: 12.sp,
        color: ColorManager.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: DarkDefaultButton(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildIcon(),
          SizedBox(width: 15.w),
          _buildTitle(),
        ],
      ),
    ));
  }
}
