import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/assets_manager.dart';
import 'package:pip/core/resources/utils.dart';
import 'package:pip/core/widgets/default_button.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../business_logic/cubit/requests_cubit.dart';
import '../../data/models/available_fast_request_model.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';

import '../../../../core/resources/style_manager.dart';

class AvailableFastReqquestItem extends StatelessWidget {
  const AvailableFastReqquestItem(
      {super.key, this.fastRequests, required this.index});

  final List<AvailableFastRequestModel>? fastRequests;
  final int index;

  _buildInfo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.w),
      child: Row(
        children: [
          _buildLeadingImage(),
          SizedBox(width: 13.w),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _buildUserName(),
                  // _buildJobTitle(),
                  SizedBox(width: 30.w),
                  _buildfasRequeststatus(),
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildPriceIcon(),
                  SizedBox(width: 10.w),
                  _buildTime(),
                  SizedBox(width: 10.w),
                  _buildNumberOffasRequestsIcon(),
                  SizedBox(width: 10.w),
                  _buildPrice(),
                ],
              ),
              SizedBox(height: 10.h),
              _buildAccepttButton(context),
              // _buildClock(),
            ],
          ),
        ],
      ),
    );
  }

  _buildAccepttButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 0.w),
      child: DefaultButton(
        text: AppStrings.accept,
        height: 32.h,
        widht: 108.w,
        textStyle: getBoldStyle(fontSize: 12.sp, color: ColorManager.black),
        onTap: () {
          BlocProvider.of<RequestsCubit>(context)
              .acceptFastRequest(requestId: fastRequests![index].id.toString());
        },
      ),
    );
  }

  _buildPrice() {
    return Text(
      AppStrings.ryal,
      maxLines: 1,
      overflow: TextOverflow.clip,
      softWrap: true,
      style: getRegularStyle(color: ColorManager.grey, fontSize: 12.sp),
    );
  }

  _buildTime() {
    return Text(
      fastRequests![index].time ?? '',
      maxLines: 1,
      overflow: TextOverflow.clip,
      softWrap: true,
      style: getRegularStyle(color: ColorManager.grey, fontSize: 12.sp),
    );
  }

  _buildfasRequeststatus() {
    return SizedBox(
      width: 100.w,
      child: Text(
        getStatusInArabic(fastRequests![index].description ?? ''),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: getBoldStyle(fontSize: 10.sp, color: ColorManager.darkSeconadry),
      ),
    );
  }

  _buildLeadingImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: SizedBox(
        width: 120.h,
        height: 80.h,
        child: CustomNetworkCachedImage(
          url: fastRequests![index].category!.imageUrl,
        ),
      ),
    );
  }

  _buildPriceIcon() {
    return Image.asset(
      ImageAssets.clock,
      fit: BoxFit.scaleDown,
      width: 12.w,
      height: 12.h,
      color: ColorManager.darkSeconadry,
    );
  }

  _buildNumberOffasRequestsIcon() {
    return Image.asset(
      ImageAssets.priceTag,
      fit: BoxFit.scaleDown,
      width: 12.w,
      height: 12.h,
      color: ColorManager.darkSeconadry,
    );
  }

  _buildUserName() {
    return Text(
      fastRequests![index].user!.name!.length > 10
          ? fastRequests![index].user!.name!.replaceRange(8, null, '.')
          : fastRequests![index].user!.name ?? '',
      maxLines: 1,
      overflow: TextOverflow.clip,
      softWrap: true,
      style: getBoldStyle(color: ColorManager.white, fontSize: 15.sp),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      decoration: BoxDecoration(
        color: ColorManager.black5,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: _buildInfo(context),
    );
  }
}
