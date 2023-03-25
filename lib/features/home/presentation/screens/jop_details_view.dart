import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/commons.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/widgets/default_button.dart';
import '../../data/models/ad_model.dart';
import '../widgets/info_item.dart';
import '../widgets/job_details_image.dart';
import '../widgets/main_info_item.dart';
import '../../../notification/presentation/widgets/clock_date.dart';
import 'package:share_plus/share_plus.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class JobDetailsView extends StatelessWidget {
  const JobDetailsView({super.key, required this.ad});

  final Ads ad;

  _buildBody() {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 60.h),
      child: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.c,
          // shrinkWrap: true,
          children: [
            JobDetailsImage(
              imageUrl: ad.image,
            ),
            SizedBox(height: 48.h),
            _buildCompanyName(),
            SizedBox(height: 15.h),
            _buildJobname(),
            SizedBox(height: 20.h),
            _buildRandomText(),
            SizedBox(height: 12.h),
            _buildDate(ad.createdAt.toString()),
            SizedBox(height: 40.h),
            _buildMainInfo(),
            SizedBox(height: 15.h),
            InfoItem(
              leading: FontAwesomeIcons.globe,
              title: ad.website ?? '',
            ),
            SizedBox(height: 15.h),
            InfoItem(
              leading: FontAwesomeIcons.locationDot,
              title: ad.location ?? '',
              trailling: FontAwesomeIcons.mapLocationDot,
            ),
            SizedBox(height: 70.h),
            Row(
              children: [
                DefaultButton(
                  text: AppStrings.applyToJob,
                  widht: 249.w,
                  onTap: () {
                    Commons.openUrl('tel://${ad.phone}');
                  },
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

  _buildDate(String date) {
    final result = DateTime.parse(date).toLocal();

    String formattedDate = DateFormat('d-M-yyyy').format(result);
    return ClockDate(
      color: ColorManager.grey,
      date: formattedDate,
    );
  }

  _buildCompanyName() {
    return Text(ad.title ?? '',
        style:
            getBoldStyle(fontSize: 20.sp, color: ColorManager.darkSeconadry));
  }

  _buildJobname() {
    return Text(ad.skillName ?? '',
        style: getRegularStyle(fontSize: 18.sp, color: ColorManager.white));
  }

  _buildRandomText() {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w),
      child: Text(ad.content ?? '',
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
          children: [
            MainInfoItem(
                title: ad.categoryName ?? '',
                icon: FontAwesomeIcons.bagShopping),
            MainInfoItem(title: ad.phone ?? '', icon: Icons.phone),
            const MainInfoItem(title: AppStrings.adPayed, icon: Icons.layers),
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
    // print(ad.id.toString());
    return Scaffold(
      appBar: CustomAppBar(
        appBarColor: ColorManager.lightBlack,
        title: AppStrings.jobDetailsAppBarTitle,
        actions: [
          IconButton(
            onPressed: () async {
              await Share.share(
                AppStrings.companyName,
                // subject: AppStrings.jobLink,
              );
            },
            icon: const Icon(FontAwesomeIcons.share),
          ),
          // Text(AppStrings.share)
        ],
      ),
      body: _buildBody(),
    );
  }
}
