import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pip/core/widgets/custom_clock_date.dart';
import 'package:pip/core/widgets/custom_network_image.dart';
import 'package:pip/features/requests/data/models/my_request_model.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/resources/route_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../../core/widgets/image_item.dart';
import '../../../home/presentation/widgets/info_item.dart';
import '../../../home/presentation/widgets/main_info_item.dart';

class WantedJobRequestsDetailsView extends StatelessWidget {
  const WantedJobRequestsDetailsView({super.key, required this.request});

  final MyRequestModel request;

  _buildImage() {
    return SizedBox(
        width: 150.w,
        height: 150.w,
        child: CircleAvatar(
          radius: 80.r,
          child: ClipOval(
            child: request.images!.isEmpty && request.category == null
                ? Container()
                : CustomNetworkCachedImage(
                    url: request.images!.isEmpty
                        ? request.category!.imageUrl!
                        : request.images!.first.attachmentUrl!),
          ),
        ));
  }

  _buildBody(BuildContext context) {
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
            CustomClockDate(date: request.createdAt.toString()),
            SizedBox(height: 40.h),
            _buildMainInfo(),
            SizedBox(height: 15.h),
            InfoItem(
              leading: FontAwesomeIcons.locationDot,
              title: request.location ?? '',
              // trailling: FontAwesomeIcons.mapLocationDot,
            ),
            SizedBox(height: 15.h),
            _buildPhotos(),

            SizedBox(height: 70.h),
            DefaultButton(
              text: '${AppStrings.showOffers}  ${request.offersCount}',
              onTap: () {
                Navigator.of(context).pushNamed(Routes.recievedOffersViewRoute);
              },
              // widht: 249.w,
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  _buildPhotos() {
    return SizedBox(
      height: 120.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ImageItem(imageUrl: request.images![index].attachmentUrl!);
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 10.w,
            );
          },
          itemCount: request.images!.length),
    );
  }

  _buildJobname() {
    return Text(request.category == null ? '' : request.category!.name ?? '',
        style:
            getBoldStyle(fontSize: 20.sp, color: ColorManager.darkSeconadry));
  }

  _buildRandomText() {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w),
      child: Text(request.description ?? '',
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
                title: '${request.offersCount} ${AppStrings.offerd}',
                icon: Icons.person),
            MainInfoItem(
                title: '${request.price ?? ''} ${AppStrings.ryal}',
                icon: FontAwesomeIcons.tags),
            const MainInfoItem(
                title: AppStrings.recieveOffers, icon: Icons.layers),
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
      body: _buildBody(context),
    );
  }
}
