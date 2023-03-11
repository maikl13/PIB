import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import 'image_with_stars.dart';

class JobItem extends StatelessWidget {
  const JobItem({super.key});

  _buildCompanyName() {
    return Text(
      AppStrings.companyName,
      style: getBoldStyle(fontSize: 12.sp, color: ColorManager.white),
    );
  }

  _buildJobtitle() {
    return Text(
      AppStrings.jobTitle,
      style: getBoldStyle(fontSize: 12.sp, color: ColorManager.grey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ImageWithRating(),
        SizedBox(height: 10.h),
        _buildCompanyName(),
        SizedBox(height: 6.h),
        _buildJobtitle(),
      ],
    );
  }
}
