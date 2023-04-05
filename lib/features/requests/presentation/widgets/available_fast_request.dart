import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/utils.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../../core/widgets/custom_image_view.dart';
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 15.w),
            _buildLeadingImage(),
            SizedBox(width: 13.w),
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildUserName(),
                // _buildJobTitle(),
                SizedBox(height: 10.h),
                if (fastRequests![index].description != null) getOrderDetails(),
                if (fastRequests![index].description != null)
                  SizedBox(height: 8.h),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildPriceIcon(),
                    SizedBox(width: 10.w),
                    _buildTime(),
                    SizedBox(width: 10.w),
                  ],
                ),
                SizedBox(height: 10.h),

                // _buildClock(),
              ],
            )),
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 20),
          child: Row(
            children: [

              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: _buildAcceptButton(context),
              )),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: _buildRejectButton(context),
              ))
            ],
          ),
        ),
      ],
    );
  }

  _buildAcceptButton(BuildContext context) {
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
  _buildRejectButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 0.w),
      child: DefaultButton(
        text: AppStrings.reject,
        height: 32.h,
        widht: 108.w,
        textStyle: getBoldStyle(fontSize: 12.sp, color: ColorManager.black),
        onTap: () {
          BlocProvider.of<RequestsCubit>(context)
              .rejectFastRequest(requestId: fastRequests![index].id.toString());
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

  getOrderDetails() {
    return Text(
      getStatusInArabic(fastRequests![index].description ?? ''),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
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
                  url: fastRequests![index].category!.imageUrl,
                  fit: BoxFit.fill,
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
    var request =  fastRequests![index];

    String user = request.user!.name!;
    String category = request.category!.name!.replaceAll("التاكسي", "تاكسي").replaceAll("توصيل سريع", "توصيل");



    return Text(
      "طلب ${ category} من ${user}",
      maxLines: 1,
      overflow: TextOverflow.clip,
      softWrap: true,
      style: getBoldStyle(color: ColorManager.white, fontSize: 15.sp),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      decoration: BoxDecoration(
        color: ColorManager.black5,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: _buildInfo(context),
    );
  }
}
