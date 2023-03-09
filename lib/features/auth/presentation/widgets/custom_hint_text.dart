import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';

class CustomHintText extends StatelessWidget {
  const CustomHintText({super.key, required this.title, this.onPressed});
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed:onPressed,
        child: Text(
        title,
          style: getRegularStyle(
              fontSize: 17.sp, color: ColorManager.darkSeconadry),
        ),
    );
  }
}