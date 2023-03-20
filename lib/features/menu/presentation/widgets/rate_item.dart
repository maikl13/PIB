import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/assets_manager.dart';
import 'package:pip/core/resources/constants.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/rating_bar.dart';
import '../../business_logic/menu_cubit.dart';

class RateItem extends StatefulWidget {
  RateItem({
    super.key,
    required this.rateNumber, required this.onRatingUpdate,
  });
  void Function(double) onRatingUpdate;
  double rateNumber;
  

  @override
  State<RateItem> createState() => _RateItemState();
}

class _RateItemState extends State<RateItem> {
  _buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildHeadline(context),
        _buildRateNumber(),
      ],
    );
  }

  _buildHeadline(BuildContext context) {
    return Text(AppStrings.easyToUse,
        style: getBoldStyle(fontSize: 15.sp, color: ColorManager.grey));
  }

  _buildRateNumber() {
    return Text(
      widget.rateNumber.toString(),
      style: getBoldStyle(color: ColorManager.darkSeconadry, fontSize: 22.sp),
    );
  }

  _buildRatingBar() {
    return SizedBox(
      width: 335.w,
      height: 50.w,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            width: 90 * (widget.rateNumber + 1).w,
            height: 50.w,
            decoration: BoxDecoration(
                color: ColorManager.white.withOpacity(.1),
                borderRadius: BorderRadius.circular(26.r)),
          ),
          Container(
            width: 335.w,
            height: 50.w,
            decoration: BoxDecoration(
              color: ColorManager.lightBlack,
              borderRadius: BorderRadius.circular(26.r),
            ),
            child: Center(
              child: RatingBar.builder(
                itemSize: 50.w,
                unratedColor: ColorManager.grey,
                // wrapAlignment: WrapAlignment.spaceBetween,
                updateOnDrag: true,
                itemPadding: EdgeInsets.symmetric(horizontal: 7.w),
                initialRating: BlocProvider.of<MenuCubit>(context).initialRating,
                itemCount: 5,

                // itemSize: 30.sp,
                itemBuilder: (context, index) {
                  // print(index.toString());
                  return widget.rateNumber.toInt() == index + 1
                      ? Container(
                          decoration: BoxDecoration(
                            color: ColorManager.white.withOpacity(.2),
                            shape: BoxShape.circle,
                          ),
                          child: SizedBox(
                            width: 25.w,
                            height: 25.w,
                            child: Transform.scale(
                              scale: .65,
                              child: Image.asset(
                                ImageAssets.activeStar,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        )
                      : SizedBox(
                          width: 25.w,
                          height: 25.w,
                          child: Transform.scale(
                            scale: .65,
                            child: Image.asset(
                              ImageAssets.activeStar,
                              fit: BoxFit.contain,
                            ),
                          ),
                        );
                },
                onRatingUpdate:widget. onRatingUpdate,
              ),
            ),
          ),
          IgnorePointer(
            ignoring: true,
            child: Container(
              width: 335.w * widget.rateNumber * .19,
              height: 50.w,
              decoration: BoxDecoration(
                  color: ColorManager.white.withOpacity(.1),
                  borderRadius: BorderRadius.circular(26.r)),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 91.h,
      decoration: BoxDecoration(
        // color: ColorManager.lightWhite,
        borderRadius: BorderRadius.all(Radius.circular(5.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(context),
          SizedBox(height: 20.h),
          _buildRatingBar(),
        ],
      ),
    );
  }
}
