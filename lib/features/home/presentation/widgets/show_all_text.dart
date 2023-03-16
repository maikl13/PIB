import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';

class ShowAllText extends StatelessWidget {
  const ShowAllText({
    super.key, this.onTap, this.text,
  });
  final void Function()? onTap;
  final String? text;

  _buildTitle() {
    return Text(
   text ??   AppStrings.showAll,
      style: getBoldStyle(fontSize: 12.sp, color: ColorManager.darkSeconadry),
    );
  }

  _buildArrow() {
    return Icon(
      Icons.arrow_forward_sharp,
      color: ColorManager.darkSeconadry,
      size: 12.sp,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTitle(),
          SizedBox(width: 12.w),
          _buildArrow(),
        ],
      ),
    );
  }
}
