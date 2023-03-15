import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pip/core/resources/constants.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/dark_default_button.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../home/presentation/widgets/image_with_stars.dart';
import '../../../notification/presentation/widgets/clock_date.dart';

class RecievedOfferItem extends StatelessWidget {
  const RecievedOfferItem({super.key});

  _buildBackground() {
    return Image.asset(
      ImageAssets.bigBackground,
      fit: BoxFit.fill,
    );
  }

  _buildAvatar() {
    return SizedBox(width: 75.w, height: 65.w, child: const ImageWithRating());
  }

  _buildMainInfo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, right: 13.w),
      child: SizedBox(
        width: 158.w,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAvatar(),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildUserName(),
                SizedBox(height: 9.h),
                Row(
                  children: [
                    _buildPriceIcon(),
                    SizedBox(width: 10.w),
                    _buildPrice(),
                    SizedBox(width: 18.w),
                    _buildTimeIcon(),
                    SizedBox(width: 10.w),
                    _buildTime(),
                  ],
                ),
                SizedBox(height: 15.h),
                _buildDescription(),
                SizedBox(height: 25.h),

                _buildButtons(context),
                // _buildPrice(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildButtons(BuildContext context) {
    return Row(
      children: [
        _buildAcceptButton(context),
        SizedBox(width: 10.w),
        _buildNegotiateButton(context),
      ],
    );
  }

  _buildAcceptButton(BuildContext context) {
    return DefaultButton(
      text: AppStrings.accept,
      height: 32.h,
      widht: 108.w,
      textStyle: getBoldStyle(fontSize: 12.sp, color: ColorManager.black),
      onTap: () {
        screenIndex = 2;
        Navigator.of(context).pushNamed(Routes.mainHomeViewRoute);
      },
    );
  }

  _buildNegotiateButton(BuildContext context) {
    return DarkDefaultButton(
      text: AppStrings.negotiate,
      height: 32.h,
      widht: 108.w,
      borderColor: ColorManager.darkSeconadry,
      textStyle:
          getBoldStyle(fontSize: 12.sp, color: ColorManager.darkSeconadry),
      onTap: () {
        Navigator.pushNamed(context, Routes.chatViewRoute);
      },
    );
  }

  _buildDescription() {
    return SizedBox(
      width: 214.w,
      child: Text(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        AppStrings.offerDesc,
        style: getRegularStyle(fontSize: 12.sp, color: ColorManager.darkGrey),
      ),
    );
  }

  _buildPriceIcon() {
    return Icon(
      FontAwesomeIcons.tags,
      color: ColorManager.darkSeconadry,
      size: 15.sp,
    );
  }

  _buildPrice() {
    return Text(
      '30 \$',
      style: getRegularStyle(fontSize: 12.sp, color: ColorManager.grey),
    );
  }

  _buildTimeIcon() {
    return Icon(
      FontAwesomeIcons.solidClock,
      color: ColorManager.darkSeconadry,
      size: 15.sp,
    );
  }

  _buildTime() {
    return Text(
      '6 days',
      style: getRegularStyle(fontSize: 12.sp, color: ColorManager.grey),
    );
  }

  _buildUserName() {
    return Text(
      AppStrings.userName,
      style: getBoldStyle(fontSize: 15.sp, color: ColorManager.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.recievedOffersDetailsViewRoute);
      },
      child: Container(
        height: 198.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
        ),
        // color: Colors.red,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildBackground(),
            _buildMainInfo(context),
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 14.h),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: ClockDate(color: ColorManager.grey)),
            ),
          ],
        ),
      ),
    );
  }
}
