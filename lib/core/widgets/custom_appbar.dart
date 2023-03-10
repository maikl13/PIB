import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/color_manager.dart';
import 'package:pip/core/resources/style_manager.dart';
import 'package:pip/core/widgets/skip_text.dart';

import 'leading_arrow.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final double? height;
  final Widget? leadingArrow;
  final List<Widget>? actions;
  final Color? appBarColor;

  const CustomAppBar(
      {super.key,
      this.title,
      this.height,
      this.leadingArrow,
      this.actions,
      this.appBarColor});

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
        leadingArrow: leadingArrow,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 60.h);
}
