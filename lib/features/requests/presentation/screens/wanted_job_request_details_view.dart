import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../home/presentation/widgets/info_item.dart';
import '../../../home/presentation/widgets/main_info_item.dart';
import '../../../notification/presentation/widgets/clock_date.dart';

class WantedJobRequestsDetailsView extends StatelessWidget {
  const WantedJobRequestsDetailsView({super.key});
  _buildImage() {
    return SizedBox(
      width: 150.w,
      height: 150.w,
      child: CircleAvatar(
        radius: 80.r,
        backgroundImage: const AssetImage(
          ImageAssets.banner,
        ),
      ),
    );
  }

  _buildBody() {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 60.h),
      child: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.c,
          // shrinkWrap: true,
          children: [
            _buildImage(),
            SizedBox(height: 48.h),
            // _buildCompanyName(),
            // SizedBox(height: 15.h),
            _buildJobname(),
            SizedBox(height: 20.h),
            _buildRandomText(),
            SizedBox(height: 12.h),
            ClockDate(color: ColorManager.grey),
            SizedBox(height: 40.h),
            _buildMainInfo(),
            SizedBox(height: 15.h),
            const InfoItem(
              leading: FontAwesomeIcons.locationDot,
              title: AppStrings.jobLocation,
              // trailling: FontAwesomeIcons.mapLocationDot,
            ),
            SizedBox(height: 15.h),
            _buildPhoto(),

            SizedBox(height: 70.h),
            const DefaultButton(
              text: AppStrings.showOffers,
              // widht: 249.w,
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  _buildPhoto() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Column(
        children: [
          Container(
            width: 136.w,
            height: 85.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    ColorManager.black.withOpacity(.3), BlendMode.darken),
                image: const AssetImage(ImageAssets.banner),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 14.h),
          Text("identity card .png",
              style: getRegularStyle(fontSize: 14.sp, color: ColorManager.grey))
        ],
      ),
    );
  }

  _buildJobname() {
    return Text(AppStrings.jobTitle,
        style:
            getBoldStyle(fontSize: 20.sp, color: ColorManager.darkSeconadry));
  }

  _buildRandomText() {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w),
      child: Text(AppStrings.randomText,
          textAlign: TextAlign.center,
          style: getBoldStyle(fontSize: 13.sp, color: ColorManager.grey)),
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
            MainInfoItem(title: AppStrings.fifteenOffer, icon: Icons.person),
            MainInfoItem(
                title: AppStrings.hundredRyal, icon: FontAwesomeIcons.tags),
            MainInfoItem(title: AppStrings.recieveOffers, icon: Icons.layers),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarColor: ColorManager.lightBlack,
        title: AppStrings.requestDetails,
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: ColorManager.darkSeconadry,
              size: 18.sp,
            ),
            onPressed: () {
              Commons.showSettingDialog(context);
            },
          ),
        ],
      ),
      body: _buildBody(),
    );
  }
}
