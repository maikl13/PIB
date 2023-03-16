import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/style_manager.dart';
import 'image_with_stars.dart';

class JobItem extends StatelessWidget {
  const JobItem({super.key, this.image, this.companyName, this.skillName});
  final String? image;
  final String? companyName;
  final String? skillName ;

  _buildCompanyName() {
    return Text(
     companyName ??'',
      style: getBoldStyle(fontSize: 12.sp, color: ColorManager.white),
    );
  }

  _buildJobtitle() {
    return Text(
      skillName??'',
      style: getBoldStyle(fontSize: 12.sp, color: ColorManager.grey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.jobDetailsViewRoute);
      },
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
