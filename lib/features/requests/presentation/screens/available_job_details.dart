import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/features/requests/business_logic/cubit/requests_cubit.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/utils.dart';
import '../../../chat/business_logic/chat_cubit.dart';
import '../../../chat/business_logic/chat_state.dart';
import '../../../../core/widgets/custom_clock_date.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/image_item.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';

import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/dark_default_button.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../home/presentation/widgets/info_item.dart';
import '../../../home/presentation/widgets/main_info_item.dart';
import '../../data/models/my_request_model.dart';

class AvailableJobDetailsView extends StatelessWidget {
  const AvailableJobDetailsView({super.key, required this.availableJob});

  final MyRequestModel availableJob;
  _buildImage() {
    return SizedBox(
      width: 150.w,
      height: 150.w,
      child: CircleAvatar(
        radius: 80.r,
        child: ClipOval(
            child: CustomNetworkCachedImage(
                url: availableJob.category!.imageUrl!)),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return BlocProvider.value(
      value: RouteGenerator.chatCubit,
      child: BlocListener<ChatCubit, ChatState>(
        listener: (context, state) {
          state.whenOrNull(

              // chatWithUserError: (networkExceptions) {
              //   Commons.showToast(message: networkExceptions.toString());
              // },
              );
        },
        child: Padding(
          padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 60.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildImage(),
                SizedBox(height: 48.h),
                // _buildCompanyName(),
                // SizedBox(height: 15.h),
                _buildJobname(),
                SizedBox(height: 20.h),
                _buildRandomText(),
                SizedBox(height: 15.h),
                _buildDate(),
                SizedBox(height: 40.h),
                _buildMainInfo(),
                SizedBox(height: 15.h),
                InfoItem(
                  leading: ImageAssets.pin1,
                  title: availableJob.location ?? '',
                  // trailling: FontAwesomeIcons.mapLocationDot,
                ),
                SizedBox(height: 15.h),
                if (availableJob.images!.length != 0) _buildPhotos(),

                SizedBox(height: 30.h),
                _buildButtons(context),
                SizedBox(height: 70.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildDate() {
    return CustomClockDate(date: availableJob.createdAt.toString());
  }

  _buildButtons(BuildContext context) {
    return Row(
      children: [
        availableJob.submittedOffer == true
            ? _buildEditOffer(context)
            : _buildGiveOffer(context),
        SizedBox(width: 10.w),
        _buildNegotiateButton(context),
      ],
    );
  }

  _buildEditOffer(BuildContext context) {
    return Expanded(
      child: DefaultButton(
        text: AppStrings.editOffer,
        onTap: () {
          // BlocProvider.of<RequestsCubit>(context).showSingleOffer(offerId);
          Navigator.pushNamed(
            context,
            Routes.editOffersViewRoute,
          );
        },
      ),
    );
  }

  _buildGiveOffer(BuildContext context) {
    return Expanded(
      child: DefaultButton(
        text: AppStrings.giveOffer,
        onTap: () {
          if (checkUserType(context)) {
            return;
          } else {
            Navigator.pushNamed(context, Routes.giveOffersViewRoute,
                arguments: {
                  'requestId': availableJob.id.toString(),
                  'jobName': availableJob.category!.name
                });
          }
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
          if (checkUserType(context)) {
            return;
          } else {
            BlocProvider.of<ChatCubit>(context).chatWithUser(
                requestId: availableJob.id.toString(),
                targetId: availableJob.user!.id.toString());
          }
        },
      ),
    );
  }

  _buildPhotos() {
    return SizedBox(
      height: 120.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ImageItem(
                imageUrl: availableJob.images![index].attachmentUrl!);
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 10.w,
            );
          },
          itemCount: availableJob.images!.length),
    );
  }

  _buildJobname() {
    return Text(availableJob.category!.name ?? '',
        style:
            getBoldStyle(fontSize: 20.sp, color: ColorManager.darkSeconadry));
  }

  _buildRandomText() {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w),
      child: Text(
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          availableJob.description ?? '',
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
          children: [
            MainInfoItem(
                title: availableJob.user!.name ?? '', icon: ImageAssets.user),
            MainInfoItem(
                title: '${availableJob.price} ${AppStrings.ryal}',
                icon: ImageAssets.tags),
            MainInfoItem(
                title: getStatusInArabic(availableJob.status!),
                icon: ImageAssets.solidLayers),
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
        actions: const [],
      ),
      body: _buildBody(context),
    );
  }
}
