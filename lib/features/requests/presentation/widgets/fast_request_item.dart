import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/utils.dart';
import '../../business_logic/cubit/requests_cubit.dart';
import '../../data/models/fast_request_model.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/dark_default_button.dart';
import '../../../../core/widgets/default_button.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';

import '../../../../core/resources/style_manager.dart';

class FastRequestItem extends StatelessWidget {
  const FastRequestItem({super.key,required this.fastRequest,required this.onTap});
  final void Function() onTap;
  final FastRequestModel fastRequest;


  _buildInfo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h, right: 15.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLeadingImage(),
          SizedBox(width: 15.w),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _buildJobTitle(),
                  SizedBox(width: 15.w),
                  _buildRequestStatus(),
                ],
              ),
              SizedBox(height: 8.h),
              fastRequest.deliveryMan == null
                  ? const SizedBox.shrink()
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildPriceIcon(),
                        SizedBox(width: 10.w),
                        _buildPrice(),
                        SizedBox(width: 10.w),
                        _buildUserIcon(),
                        SizedBox(width: 10.w),
                        _buildUserName(),
                      ],
                    ),
              SizedBox(height: 10.h),

              _buildButtons(context),
              // SizedBox(height: 10.h),
            ],
          ),
        ],
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

  _buildUserIcon() {
    return Image.asset(
      ImageAssets.user,
      fit: BoxFit.scaleDown,
      width: 12.w,
      height: 12.h,
      color: ColorManager.darkSeconadry,
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

  _buildUserName() {
    return Text(
      fastRequest.deliveryMan == null
          ? ''
          : fastRequest.deliveryMan!.name ?? '',
      maxLines: 1,
      overflow: TextOverflow.clip,
      softWrap: true,
      style: getRegularStyle(color: ColorManager.grey, fontSize: 12.sp),
    );
  }

  _buildButtons(BuildContext context) {
    return Row(
      children: [
        fastRequest.status == "closed" ||
                fastRequest.status == "canceled" ||
                fastRequest.status == "complete"
            ? Container()
            : fastRequest.status == "active"
                ? _buildCancelButton(context)
                : _buildCompleteButton(context),
        // _buildCancelButton(context),
      ],
    );
  }

  _buildCompleteButton(BuildContext context) {
    return DefaultButton(
      text: AppStrings.complete,
      height: 32.h,
      widht: 80.w,
      textStyle: getBoldStyle(fontSize: 12.sp, color: ColorManager.black),
      onTap: () {
        //TODO ask price
        BlocProvider.of<RequestsCubit>(context).completeFastRequest(
            requestId: fastRequest.id.toString(), price: '290');
      },
    );
  }

  _buildCancelButton(BuildContext context) {
    return DarkDefaultButton(
      text: AppStrings.cancel,
      height: 32.h,
      widht: 80.w,
      borderColor: ColorManager.darkSeconadry,
      textStyle:
          getBoldStyle(fontSize: 12.sp, color: ColorManager.darkSeconadry),
      onTap: () {
        BlocProvider.of<RequestsCubit>(context)
            .cancelFastRequest(requestId: fastRequest.id.toString());
      },
    );
  }

  _buildJobTitle() {
    return Text(
      fastRequest.category == null
          ? ''
          : fastRequest.category!.name ?? '',
      style: getBoldStyle(color: ColorManager.white, fontSize: 15.sp),
    );
  }

  _buildRequestStatus() {
    return Text(
      getStatusInArabic(fastRequest.status ?? ''),
      style: getBoldStyle(fontSize: 10.sp, color: ColorManager.darkSeconadry),
    );
  }

  _buildLeadingImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: SizedBox(
        width: 120.h,
        height: 80.h,
        child: fastRequest.category!.imageUrl!.isEmpty &&
                (fastRequest.category == null ||
                    fastRequest.category!.imageUrl == '')
            ? Container()
            : CustomNetworkCachedImage(
                url: (fastRequest.category!.imageUrl)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  InkWell(
        onTap: onTap,
        child:Container(
      height: 110.h,
      decoration: BoxDecoration(
        color: ColorManager.black5,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: _buildInfo(context),
    ));
  }
}
