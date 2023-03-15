import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/color_manager.dart';
import 'package:pip/core/resources/constants.dart';
import 'package:pip/core/resources/style_manager.dart';
import 'package:pip/features/pip/presentation/widgets/custom_switch.dart';

class SkillItem extends StatefulWidget {
  const SkillItem({super.key, required this.title, required this.image});

  final String title;
  final String image;

  @override
  State<SkillItem> createState() => _SkillItemState();
}

class _SkillItemState extends State<SkillItem> {
  _buildIcon() {
    return SizedBox(
      width: 35.w,
      height: 35.h,
      child: CircleAvatar(
          radius: 25.r,
          backgroundColor: ColorManager.darkSeconadry,
          child: Image.asset(
            widget.image,
            width: 15.w,
            height: 15.h,
            fit: BoxFit.contain,
          )),
    );
  }

  _buildTitle() {
    return Text(
      widget.title,
      style: getBoldStyle(fontSize: 15.sp, color: ColorManager.grey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 115.h,
      decoration: BoxDecoration(
        border: Border.all(
            color: val ? ColorManager.darkSeconadry : ColorManager.transparent),
        color: ColorManager.black5,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 20.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: 20.h),
                _buildIcon(),
                SizedBox(height: 15.h),
                _buildTitle(),
              ],
            ),
            CustomSwitch(
              onChanged: (value) {
                setState(() {
                  val = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
