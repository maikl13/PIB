import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pip/core/resources/constants.dart';
import 'package:pip/core/resources/route_manager.dart';
import 'package:pip/core/widgets/custom_clock_date.dart';
import 'package:pip/features/requests/data/models/offer_model.dart';
import '../../../../core/widgets/image_item.dart';
import '../../../home/presentation/widgets/job_details_image.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/dark_default_button.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../home/presentation/widgets/main_info_item.dart';

class RecievedOfferDetails extends StatelessWidget {
  const RecievedOfferDetails({super.key, required this.offer});

  final OfferModel offer;

  _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 60.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            JobDetailsImage(
              imageUrl: offer.user!.imageUrl,
            ),
            SizedBox(height: 48.h),
            _buildUserName(),
            SizedBox(height: 20.h),
            _buildDescriptionText(),
            SizedBox(height: 12.h),
            _buildDate(),
            SizedBox(height: 40.h),
            _buildMainInfo(),
            SizedBox(height: 25.h),
            _buildPhotos(),
            SizedBox(height: 70.h),
            _buildButtons(context),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  _buildDate() {
    return CustomClockDate(date: offer.createdAt.toString());
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
    return Expanded(
      child: DefaultButton(
        text: AppStrings.accept,
        onTap: () {
          screenIndex = 2;

          Navigator.pushNamed(context, Routes.mainHomeViewRoute);
          //
        },
      ),
    );
  }

  _buildNegotiateButton(BuildContext context) {
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

  _buildPhotos() {
    return SizedBox(
      height: 120.h,
      child: ListView.separated(
          // shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ImageItem(
                imageUrl: offer.attachments![index].attachmentUrl!);
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 10.w,
            );
          },
          itemCount: offer.attachments!.length),
    );
  }

  _buildUserName() {
    return Text(offer.user!.name ?? '',
        style:
            getBoldStyle(fontSize: 20.sp, color: ColorManager.darkSeconadry));
  }

  _buildDescriptionText() {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w),
      child: Text(
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          offer.description ?? '',
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
          children: [
            MainInfoItem(
                title: offer.request!.category ?? '',
                icon: Icons.cases_rounded),
            MainInfoItem(
                title: "${offer.price} ${AppStrings.ryal}",
                icon: FontAwesomeIcons.tags),
            MainInfoItem(
                title: '${offer.duration} ايام',
                icon: FontAwesomeIcons.solidClock),
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
      body: _buildBody(context),
    );
  }
}
