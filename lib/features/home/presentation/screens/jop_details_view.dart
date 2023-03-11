import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/widgets/default_button.dart';
import '../widgets/info_item.dart';
import '../widgets/job_details_image.dart';
import '../widgets/main_info_item.dart';
import '../../../notification/presentation/widgets/clock_date.dart';
import 'package:share_plus/share_plus.dart';

class JobDetailsView extends StatelessWidget {
  const JobDetailsView({super.key});

  _buildBody() {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 60.h),
      child: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.c,
          // shrinkWrap: true,
          children: [
            const JobDetailsImage(),
            SizedBox(height: 48.h),
            _buildCompanyName(),
            SizedBox(height: 15.h),
            _buildJobname(),
            SizedBox(height: 20.h),
            _buildRandomText(),
            SizedBox(height: 12.h),
            ClockDate(color: ColorManager.grey),
            SizedBox(height: 40.h),
            _buildMainInfo(),
            SizedBox(height: 15.h),
            const InfoItem(
              leading: FontAwesomeIcons.globe,
              title: AppStrings.jobLink,
            ),
            SizedBox(height: 15.h),
            const InfoItem(
              leading: FontAwesomeIcons.locationDot,
              title: AppStrings.jobLocation,
              trailling: FontAwesomeIcons.mapLocationDot,
            ),
            SizedBox(height: 70.h),
            Row(
              children: [
                DefaultButton(
                  text: AppStrings.applyToJob,
                  widht: 249.w,
                ),
                SizedBox(width: 10.w),
                _buildShareButton(),
              ],
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  _buildCompanyName() {
    return Text(AppStrings.companyName,
        style:
            getBoldStyle(fontSize: 20.sp, color: ColorManager.darkSeconadry));
  }

  _buildJobname() {
    return Text(AppStrings.jobTitle,
        style: getRegularStyle(fontSize: 18.sp, color: ColorManager.white));
  }

  _buildRandomText() {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w),
      child: Text(AppStrings.randomText,
          textAlign: TextAlign.center,
          style: getRegularStyle(fontSize: 13.sp, color: ColorManager.grey)),
    );
  }

  _buildMainInfo() {
    return Container(
      width: double.infinity,
      height: 90.h,
      decoration: BoxDecoration(
        color: ColorManager.lightBlack,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            MainInfoItem(
                title: AppStrings.partTimeJobs,
                icon: FontAwesomeIcons.bagShopping),
            MainInfoItem(title: AppStrings.zeros, icon: Icons.phone),
            MainInfoItem(title: AppStrings.adPayed, icon: Icons.layers),
          ],
        ),
      ),
    );
  }

  _buildShareButton() {
    return InkWell(
      onTap: () async {
        await Share.share(
          AppStrings.companyName,
          // subject: AppStrings.jobLink,
        );
      },
      child: Container(
        width: 76.w,
        height: 51.h,
        decoration: BoxDecoration(
          color: ColorManager.darkSeconadry,
          borderRadius: BorderRadius.circular(31.r),
        ),
        child: Icon(
          FontAwesomeIcons.share,
          color: ColorManager.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarColor: ColorManager.lightBlack,
        title: AppStrings.jobDetailsAppBarTitle,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.share),
          ),
          // Text(AppStrings.share)
        ],
      ),
      body: _buildBody(),
    );
  }
}
