import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pip/core/resources/constants.dart';
import 'package:pip/core/resources/route_manager.dart';
import '../../../home/presentation/widgets/job_details_image.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/dark_default_button.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../home/presentation/widgets/main_info_item.dart';
import '../../../notification/presentation/widgets/clock_date.dart';

class RecievedOfferDetails extends StatefulWidget {
  const RecievedOfferDetails({super.key});

  @override
  State<RecievedOfferDetails> createState() => _RecievedOfferDetailsState();
}

class _RecievedOfferDetailsState extends State<RecievedOfferDetails> {
  _buildBody() {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 60.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const JobDetailsImage(),
            SizedBox(height: 48.h),
            _buildUserName(),
            // SizedBox(height: 15.h),
            // _buildJobname(),
            SizedBox(height: 20.h),
            _buildDescriptionText(),
            SizedBox(height: 12.h),
            ClockDate(color: ColorManager.grey),
            SizedBox(height: 40.h),
            _buildMainInfo(),
            SizedBox(height: 25.h),
            _buildPhoto(),
            SizedBox(height: 70.h),
            _buildButtons(),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  _buildButtons() {
    return Row(
      children: [
        _buildAcceptButton(),
        SizedBox(width: 10.w),
        _buildNegotiateButton(),
      ],
    );
  }

  _buildAcceptButton() {
    return Expanded(
      child: DefaultButton(
        text: AppStrings.accept,
        onTap: () {
          setState(() {
            screenIndex = 2;
          });
          Navigator.pushNamed(context, Routes.mainHomeViewRoute);
          //
        },
      ),
    );
  }

  _buildNegotiateButton() {
    return Expanded(
      child: DarkDefaultButton(
        text: AppStrings.negotiate,
        borderColor: ColorManager.darkSeconadry,
        textStyle:
            getBoldStyle(fontSize: 16.sp, color: ColorManager.darkSeconadry),
        onTap: () {
          Navigator.pushNamed(context, Routes.chatViewRoute);
        },
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

  _buildUserName() {
    return Text(AppStrings.userName,
        style:
            getBoldStyle(fontSize: 20.sp, color: ColorManager.darkSeconadry));
  }

  _buildDescriptionText() {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w),
      child: Text(
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          AppStrings.offerDesc,
          textAlign: TextAlign.center,
          style:
              getBoldStyle(fontSize: 13.sp, color: ColorManager.grey).copyWith(
            height: 2,
            // letterSpacing: 0.5,
          )),
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
            MainInfoItem(title: AppStrings.plumber, icon: Icons.cases_rounded),
            MainInfoItem(
                title: AppStrings.hundredRyal, icon: FontAwesomeIcons.tags),
            MainInfoItem(title: '6 days', icon: FontAwesomeIcons.solidClock),
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
        title: AppStrings.userName,
        actions: const [],
      ),
      body: _buildBody(),
    );
  }
}
