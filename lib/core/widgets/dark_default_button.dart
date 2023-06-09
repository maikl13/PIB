import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/color_manager.dart';
import '../resources/style_manager.dart';

class DarkDefaultButton extends StatelessWidget {
  const DarkDefaultButton(
      {super.key,
      this.text,
      this.height,
      this.widht,
      this.onTap,
      this.color,
      this.textStyle,
      this.child, this.borderColor});
  final String? text;
  final double? height;
  final double? widht;
  final Color? color;
  final void Function()? onTap;
  final TextStyle? textStyle;
  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: widht ?? double.infinity,
        height: height ?? 49.h,
        decoration: BoxDecoration(
            color: color ?? ColorManager.transparent,
            border: Border.all(color: borderColor ?? ColorManager.darkGrey),
            borderRadius: BorderRadius.all(Radius.circular(31.r))),
        child: child ??
            Center(
              child: Text(
                text ?? 'default text',
                style: textStyle ??
                    getBoldStyle(
                      color: ColorManager.grey,
                      fontSize: 16.sp,
                    ),
              ),
            ),
      ),
    );
  }
}
