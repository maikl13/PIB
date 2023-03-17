import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pip/core/widgets/custom_network_image.dart';
import 'package:pip/features/requests/data/models/my_request_model.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../notification/presentation/widgets/clock_date.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import '../../../../core/resources/style_manager.dart';

class RequestItem extends StatelessWidget {
  const RequestItem(
      {super.key, required this.onTap, this.requests, this.index});
  final void Function() onTap;
  final List<MyRequestModel>? requests;
  final int? index;
  _buildInfo() {
    return Padding(
      padding: EdgeInsets.only(top: 15.h, right: 15.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLeadingImage(),
          SizedBox(width: 15.w),
          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Column(
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
                _buildClock(requests![index!].createdAt.toString()),
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
      requests![index!].category!.name ?? '',
      style: getBoldStyle(color: ColorManager.white, fontSize: 15.sp),
    );
  }

  _buildRequestStatus() {
    return Text(
      AppStrings.requestStatus,
      style: getBoldStyle(fontSize: 10.sp, color: ColorManager.darkSeconadry),
    );
  }

  _buildLeadingImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: SizedBox(
        width: 120.h,
        height: 80.h,
        child: CustomNetworkCachedImage(
            url: requests![index!].category!.imageUrl!),
      ),
    );
  }

  _buildPriceIcon() {
    return Icon(
      FontAwesomeIcons.tags,
      color: ColorManager.darkSeconadry,
      size: 12.sp,
    );
  }

  _buildPrice() {
    return Text(
      requests![index!].price.toString(),
      style: getRegularStyle(color: ColorManager.grey, fontSize: 12.sp),
    );
  }

  _buildNumberOfRequestsIcon() {
    return Icon(
      Icons.person,
      color: ColorManager.darkSeconadry,
      size: 12.sp,
    );
  }

  _buildNumberOfRequests() {
    return Text(
      '${requests![index!].offersCount} عرض',
      style: getRegularStyle(color: ColorManager.grey, fontSize: 12.sp),
    );
  }

  _buildArrow() {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, left: 20.w),
      child: Align(
        alignment: Alignment.topLeft,
        child: Icon(
          Icons.arrow_forward,
          color: ColorManager.darkSeconadry,
          size: 16.sp,
        ),
      ),
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
