import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/color_manager.dart';

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
      actions: actions,
      title: Text(
        title ?? '',
      ),
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // SizedBox(width: 20.w),
          InkWell(
            onTap: () => Navigator.pop(context),
            child: leadingArrow ??
                Container(
                  width: 35.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                    color: ColorManager.darkSeconadry,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: ColorManager.black,
                      // size: 20.sp,
                    ),
                  ),
                ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 60.h);
}
