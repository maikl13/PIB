import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/color_manager.dart';
import '../resources/style_manager.dart';
import 'skip_text.dart';

import 'leading_arrow.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final double? height;
  final Widget? leadingArrow;
  final List<Widget>? actions;
  final Color? appBarColor;
  final void Function()? onTap;

  const CustomAppBar(
      {super.key,
      this.title,
      this.height,
      this.leadingArrow,
      this.actions,
      this.appBarColor, this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appBarColor ?? ColorManager.darkBlack,
      actions: actions ??
          [
            const SkipText(),
          ],
      title: Text(
        title ?? '',
        style: getRegularStyle(fontSize: 18.sp, color: ColorManager.white),
      ),
      leading: LeadingArrow(
        onTap:  onTap ?? () => Navigator.pop(context),

        leadingArrow: leadingArrow,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 60.h);
}
