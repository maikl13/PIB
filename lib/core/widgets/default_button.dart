import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/color_manager.dart';
import '../resources/style_manager.dart';

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
            gradient: RadialGradient(
              colors: const [Color(0xFFFFC638), Color(0xFFF7B100)],
              radius: 1.h,
              center: const Alignment(0.0, 0.0),
            ),
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
// Container(
//     decoration: BoxDecoration(
//       gradient: RadialGradient(
//         center: Alignment(0.0, 0.0),
//         radius: 0.395,
//         colors: [const Color(0xffffc638), const Color(0xfff7b100)],
//         stops: [0.0, 1.0],
//         transform: GradientXDTransform(
//             1.0, 0.0, 0.0, 2.702, 0.0, -0.851, Alignment(0.0, 0.0)),
//       ),
//       borderRadius: BorderRadius.circular(31.0),
//     ),
//   )
