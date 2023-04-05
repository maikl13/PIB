import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/features/pip/data/models/driver_model.dart';
import 'package:pip/features/pip/presentation/widgets/contact_button.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/utils.dart';
import '../../../../core/widgets/custom_image_view.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../data/models/accepted_offers_model.dart';
import '../../data/models/my_request_model.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../notification/presentation/widgets/clock_date.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import '../../../../core/resources/style_manager.dart';

class AcceptedRequestItem extends StatelessWidget {
  const AcceptedRequestItem(
      {super.key, required this.onTap, this.requests, required this.index});
  final void Function() onTap;
  final List<AcceptedOffersModel>? requests;
  final int index;

  _buildInfo() {
    return Padding(
      padding: EdgeInsets.only(top: 15.h, right: 15.w),
      child: Row(
        // mainAxisSize: Maina,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLeadingImage(),
          SizedBox(width: 15.w),
          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _buildJobTitle(),
                    SizedBox(width: 13.w),
                    _buildRequestStatus(),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // _buildPriceIcon(),
                    // SizedBox(width: 10.w),
                    // _buildPrice(),
                    // SizedBox(width: 10.w),
                    _buildUserNameIcon(),
                    SizedBox(width: 10.w),
                    _buildUserNameText(),
                    // _buildNumberOfRequests(),
                  ],
                ),
                SizedBox(height: 10.h),
                _buildTime(),
                // _buildClock(requests![index].createdAt.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildTime() {
    return Text(
      requests![index].time == null ? '' : requests![index].time ?? '',
      style: getRegularStyle(color: ColorManager.grey, fontSize: 12.sp),
    );
  }

  _buildUserNameText() {
    return Text(
      requests![index].user!.name == null
          ? ''
          : requests![index].user!.name ?? '',
      style: getRegularStyle(color: ColorManager.grey, fontSize: 12.sp),
    );
  }
  // _buildClock(String date) {
  //   final result = DateTime.parse(date).toLocal();

  //   String formattedDate = DateFormat('d-M-yyyy').format(result);

  //   return ClockDate(
  //     color: ColorManager.grey,
  //     date: formattedDate,
  //   );
  // }

  _buildJobTitle() {
    return Text(
      requests![index].category!.name == null
          ? ''
          : requests![index].category!.name ?? '',
      style: getBoldStyle(color: ColorManager.white, fontSize: 15.sp),
    );
  }

  _buildRequestStatus() {
    return Text(
      getStatusInArabic(requests![index].status ?? ''),
      style: getBoldStyle(fontSize: 10.sp, color: ColorManager.darkSeconadry),
    );
  }

  _buildLeadingImage() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: SizedBox(
            width: 120.h,
            height: 80.h,
            child: Stack(
              children: [
                CustomNetworkCachedImage(
                  url: requests![index].category!.imageUrl ?? '',
                ),
                CustomImageView(
                  svgPath: ImageAssets.shadow,
                  width: 120.h,
                  height: 80.h,
                  fit: BoxFit.fill,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  // _buildPriceIcon() {
  //   return Image.asset(
  //     ImageAssets.priceTag,
  //     fit: BoxFit.scaleDown,
  //     width: 12.w,
  //     height: 12.h,
  //     color: ColorManager.darkSeconadry,
  //   );
  // }

  // _buildPrice() {
  //   return Text(
  //     ' ${AppStrings.ryal}',
  //     maxLines: 1,
  //     overflow: TextOverflow.ellipsis,
  //     style: getRegularStyle(color: ColorManager.grey, fontSize: 12.sp),
  //   );
  // }

  _buildUserNameIcon() {
    return Image.asset(
      ImageAssets.user,
      fit: BoxFit.scaleDown,
      width: 12.w,
      height: 12.h,
      color: ColorManager.darkSeconadry,
    );
  }

  // _buildNumberOfRequests() {
  //   return Text(
  //     maxLines: 1,
  //     overflow: TextOverflow.clip,
  //     requests![index].offersCount == null
  //         ? requests![index].user!.name!.length > 10
  //             ? requests![index].user!.name!.replaceRange(8, null, '.')
  //             : requests![index].user!.name ?? ''
  //         : '${requests![index].offersCount} عرض',
  //     softWrap: true,
  //     style: getRegularStyle(color: ColorManager.grey, fontSize: 12.sp),
  //   );
  // }

  _buildArrow() {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, left: 20.w),
      child: Align(
          alignment: Alignment.topLeft,
          child: Image.asset(
            ImageAssets.rightArrow,
            color: ColorManager.darkSeconadry,
            width: 16.w,
            height: 16.h,
          )),
    );
  }

  _bulildContactButton() {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h, left: 10.w),
      child: Align(
          alignment: Alignment.bottomLeft,
          child: requests![index].status != "processing"
              ? const SizedBox.shrink()
              : ContactButton(
                  phoneNumber: requests![index].user!.phone ?? '',
                )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 110.h,
        decoration: BoxDecoration(
          color: ColorManager.black5,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Stack(
          children: [
            _buildInfo(),
            _buildArrow(),
            _bulildContactButton(),
          ],
        ),
      ),
    );
  }
}
