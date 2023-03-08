import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/color_manager.dart';
import 'package:pip/core/resources/style_manager.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {super.key,
      required this.text,
      this.height,
      this.widht,
      this.onTap,
      this.color,
      this.textStyle});
  final String text;
  final double? height;
  final double? widht;
  final Color? color;
  final void Function()? onTap;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: widht ?? double.infinity,
        height: height ?? 49.h,
        decoration: BoxDecoration(
            color: color ?? ColorManager.darkSeconadary,
            borderRadius: BorderRadius.all(Radius.circular(31.r))),
        child: Center(
          child: Text(
            text,
            style: textStyle ??
                getBoldStyle(
                  color: ColorManager.lightBlack,
                  fontSize: 16.sp,
                ),
          ),
        ),
      ),
    );
  }
}
