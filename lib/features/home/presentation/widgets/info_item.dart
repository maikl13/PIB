import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';

class InfoItem extends StatelessWidget {
  const InfoItem(
      {super.key,
      this.title,
      required this.leading,
      this.trailling,
      this.decoration});
  final String? title;
  final String leading;
  final String? trailling;
  final TextDecoration? decoration;

  _buildLeading() {
    return Image.asset(
      leading,
      width: 17.sp,
      height: 17.sp,
      color: ColorManager.darkSeconadry,
    );
  }

  _buildTitle() {
    return Text(
      title ?? "",
      style:
          getRegularStyle(fontSize: 13.sp, color: ColorManager.grey).copyWith(
        decoration: decoration ?? TextDecoration.none,
        decorationColor: ColorManager.grey,
      ),
    );
  }

  _buildTrailling() {
    return trailling == null
        ? Container()
        : Image.asset(
            trailling!,
            width: 17.sp,
            height: 17.sp,
            color: ColorManager.darkSeconadry,
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
