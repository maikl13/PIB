import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import 'image_with_stars.dart';

class JobItem extends StatelessWidget {
  const JobItem(
      {super.key, this.image, this.companyName, this.skillName, this.onTap});
  final String? image;
  final String? companyName;
  final String? skillName;
  final void Function()? onTap;

  _buildCompanyName() {
    return Text(
         textScaleFactor: 1,
        maxLines: 1,

      companyName ?? '',
      style: getBoldStyle(fontSize: 12.sp, color: ColorManager.white),
    );
  }

  _buildJobtitle() {
    return Flexible(
      child: Text(
        skillName ?? '',
        maxLines: 1,
        textScaleFactor: 1,
        overflow: TextOverflow.clip,
        style: getBoldStyle(fontSize: 12.sp, color: ColorManager.grey),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          ImageWithRating(image: image),
          SizedBox(height: 10.h),
          _buildCompanyName(),
          SizedBox(height: 6.h),
          _buildJobtitle(),
        ],
      ),
    );
  }
}
