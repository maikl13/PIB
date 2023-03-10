import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/color_manager.dart';
import 'package:pip/core/resources/style_manager.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({super.key, this.title, this.leading, this.trailling});
  final String? title;
  final IconData? leading;
  final IconData? trailling;

  _buildLeading() {
    return Icon(
      leading,
      color: ColorManager.darkSeconadry,
      size: 17.sp,
    );
  }

  _buildTitle() {
    return Text(
      title ?? "",
      style: getRegularStyle(fontSize: 13.sp, color: ColorManager.grey),
    );
  }

  _buildTrailling() {
    return trailling == null
        ? Container()
        : Icon(
            trailling,
            color: ColorManager.darkSeconadry,
            size: 17.sp,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.h,
      decoration: BoxDecoration(
        color: ColorManager.lightBlack,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(right: 20.w, left: 20.w),
        child: Row(
          children: [
            _buildLeading(),
            SizedBox(width: 10.w),
            _buildTitle(),
            const Spacer(),
            _buildTrailling(),
          ],
        ),
      ),
    );
  }
}
