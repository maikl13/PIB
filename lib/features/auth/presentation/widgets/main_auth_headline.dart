import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/color_manager.dart';
import 'package:pip/core/resources/strings_manager.dart';
import 'package:pip/core/resources/style_manager.dart';

class MainAuthHeadline extends StatelessWidget {
  const MainAuthHeadline({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: AppStrings.hello,
            style: getBoldStyle(
                fontSize: 28.sp, color: ColorManager.darkSeconadry)),
        WidgetSpan(child: SizedBox(width: 12.w)),
        TextSpan(
            text: AppStrings.you,
            style: getBoldStyle(fontSize: 28.sp, color: ColorManager.white)),
      ]),
    );
  }
}
