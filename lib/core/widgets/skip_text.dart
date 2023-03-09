import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/strings_manager.dart';
import 'package:pip/core/resources/style_manager.dart';

import '../resources/color_manager.dart';

class SkipText extends StatelessWidget {
  const SkipText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 23.w),
      child: Text(
        AppStrings.skip,
        style: getBoldStyle(
          color: ColorManager.darkSeconadry,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
