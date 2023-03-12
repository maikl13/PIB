import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/color_manager.dart';
import 'package:pip/core/resources/style_manager.dart';
import 'package:pip/features/pip/presentation/widgets/custom_switch.dart';

class SkillItem extends StatelessWidget {
  const SkillItem({super.key});
  _buildIcon() {
    return SizedBox(
      width: 35.w,
      height: 35.h,
      child: CircleAvatar(
        radius: 25.r,
        backgroundColor: ColorManager.darkSeconadry,
        child: Icon(
          Icons.add_a_photo,
          color: ColorManager.white,
        ),
      ),
    );
  }

  _buildTitle() {
    return Text(
      "data",
      style: getBoldStyle(fontSize: 15.sp, color: ColorManager.grey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 115.h,
      decoration: BoxDecoration(
        color: ColorManager.black5,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding:
            EdgeInsets.only(right: 31.w, left: 21.w, top: 21.h, bottom: 21.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIcon(),
                const CustomSwitch(),
              ],
            ),
            _buildTitle(),
          ],
        ),
      ),
    );
  }
}
