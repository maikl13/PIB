import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../home/presentation/widgets/image_with_stars.dart';
import '../../../home/presentation/widgets/show_all_text.dart';
import '../../../notification/presentation/widgets/clock_date.dart';

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({super.key});

  _buildBackground() {
    return Image.asset(
      ImageAssets.resultBackground,
      fit: BoxFit.fill,
    );
  }

  _buildMainInfo() {
    return Padding(
      padding: EdgeInsets.only(top: 30.h, right: 25.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ImageWithRating(),
          SizedBox(width: 20.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCompanyName(),
              SizedBox(height: 18.h),
              Row(
                children: [
                  _buildJobtitleIcon(),
                  SizedBox(width: 10.w),
                  _buildJobtitle(),
                  SizedBox(width: 13.w),
                  _buildJobTypeIcon(),
                  SizedBox(width: 10.w),
                  _buildJobType(),
                ],
              ),
              // _buildJobtitle(),
            ],
          ),
        ],
      ),
    );
  }

  _buildJobtitleIcon() {
    return Icon(
      Icons.work,
      color: ColorManager.darkSeconadry,
      size: 15.sp,
    );
  }

  _buildJobtitle() {
    return Text(
      AppStrings.jobTitle,
      style: getBoldStyle(fontSize: 12.sp, color: ColorManager.grey),
    );
  }

  _buildJobTypeIcon() {
    return Icon(
      Icons.work,
      color: ColorManager.darkSeconadry,
      size: 15.sp,
    );
  }

  _buildJobType() {
    return Text(
      AppStrings.partTimeJobs,
      style: getBoldStyle(fontSize: 12.sp, color: ColorManager.grey),
    );
  }

  _buildCompanyName() {
    return Text(
      AppStrings.companyName,
      style: getBoldStyle(fontSize: 15.sp, color: ColorManager.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.jobDetailsViewRoute);
      },
      child: Container(
        height: 131.w,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
        ),
        // color: Colors.red,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildBackground(),
            _buildMainInfo(),
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 17.h),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: ClockDate(color: ColorManager.grey)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 90.h, left: 20.w),
              child: const Align(
                  alignment: Alignment.centerLeft, child: ShowAllText()),
            ),
          ],
        ),
      ),
    );
  }
}
