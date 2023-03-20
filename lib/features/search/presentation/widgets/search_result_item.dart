import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../home/data/models/ad_model.dart';
import '../../../home/presentation/widgets/image_with_stars.dart';
import '../../../home/presentation/widgets/show_all_text.dart';
import '../../../notification/presentation/widgets/clock_date.dart';

class SearchResultItem extends StatelessWidget {
  const SearchResultItem(
      {super.key,
      this.image,
      this.companyName,
      this.jobTitle,
      this.typeHeadline, required this.ad});

  final String? image;
  final String? companyName;
  final String? jobTitle;
  final String? typeHeadline;

  final Ads ad;
  _buildBackground() {
    return Image.asset(
      ImageAssets.resultBackground,
      fit: BoxFit.fill,
    );
  }

  _buildMainInfo() {
    return Padding(
      padding: EdgeInsets.only(top: 30.w, right: 25.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageWithRating(
            image: image,
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCompanyName(),
              SizedBox(height: 15.w),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildJobtitleIcon(),
                  SizedBox(width: 6.w),
                  _buildJobtitle(),
                  SizedBox(width: 10.w),
                  _buildJobTypeIcon(),
                  SizedBox(width: 6.w),
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
      maxLines: 1,
      overflow: TextOverflow.clip,
      jobTitle ?? '',
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
      maxLines: 1,
      overflow: TextOverflow.clip,
      typeHeadline ?? '',
      style: getBoldStyle(fontSize: 12.sp, color: ColorManager.grey),
    );
  }

  _buildCompanyName() {
    return Text(
      companyName ?? '',
      style: getBoldStyle(fontSize: 15.sp, color: ColorManager.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.jobDetailsViewRoute,arguments: {
          'ad': ad,
        });
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
              padding: EdgeInsets.only(left: 10.w, top: 17.w),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: ClockDate(color: ColorManager.grey)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 90.w, left: 20.w),
              child: const Align(
                  alignment: Alignment.centerLeft,
                  child: ShowAllText(
                    text: AppStrings.showJob,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
