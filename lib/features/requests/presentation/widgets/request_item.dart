import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/assets_manager.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../data/models/my_request_model.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../notification/presentation/widgets/clock_date.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import '../../../../core/resources/style_manager.dart';

class RequestItem extends StatelessWidget {
  const RequestItem(
      {super.key, required this.onTap, this.requests, required this.index});
  final void Function() onTap;
  final List<MyRequestModel>? requests;
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
                    _buildPriceIcon(),
                    SizedBox(width: 10.w),
                    _buildPrice(),
                    SizedBox(width: 10.w),
                    _buildNumberOfRequestsIcon(),
                    SizedBox(width: 10.w),
                    _buildNumberOfRequests(),
                  ],
                ),
                SizedBox(height: 10.h),
                _buildClock(requests![index].createdAt.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildClock(String date) {
    final result = DateTime.parse(date).toLocal();

    String formattedDate = DateFormat('d-M-yyyy').format(result);

    return ClockDate(
      color: ColorManager.grey,
      date: formattedDate,
    );
  }

  _buildJobTitle() {
    return Text(
      requests![index].category == null
          ? ''
          : requests![index].category!.name ?? '',
      style: getBoldStyle(color: ColorManager.white, fontSize: 15.sp),
    );
  }

  _buildRequestStatus() {
    return Text(
      requests![index].status ?? '',
      style: getBoldStyle(fontSize: 10.sp, color: ColorManager.darkSeconadry),
    );
  }

  _buildLeadingImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: SizedBox(
        width: 120.h,
        height: 80.h,
        child: requests![index].images!.isEmpty &&
                requests![index].category == null
            ? Container()
            : CustomNetworkCachedImage(
                url: requests![index].category!.imageUrl),
      ),
    );
  }

  _buildPriceIcon() {
    return Image.asset(
      ImageAssets.priceTag,
      fit: BoxFit.scaleDown,
      width: 12.w,
      height: 12.h,
      color: ColorManager.darkSeconadry,
    );
  }

  _buildPrice() {
    return Text(
      '${requests![index].price}  ${AppStrings.ryal}',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: getRegularStyle(color: ColorManager.grey, fontSize: 12.sp),
    );
  }

  _buildNumberOfRequestsIcon() {
    return Image.asset(
      ImageAssets.user,
      fit: BoxFit.scaleDown,
      width: 12.w,
      height: 12.h,
      color: ColorManager.darkSeconadry,
    );
  }

  _buildNumberOfRequests() {
    return Text(
      maxLines: 1,
      overflow: TextOverflow.clip,
      requests![index].offersCount == null
          ? requests![index].user!.name!.length > 10
              ? requests![index].user!.name!.replaceRange(8, null, '.')
              : requests![index].user!.name ?? ''
          : '${requests![index].offersCount} عرض',
      softWrap: true,
      style: getRegularStyle(color: ColorManager.grey, fontSize: 12.sp),
    );
  }

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
          ],
        ),
      ),
    );
  }
}
