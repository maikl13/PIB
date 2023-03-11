import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_title.dart';
import '../widgets/pick_request_item.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../widgets/custom_switch.dart';

class FastRequestView extends StatelessWidget {
  const FastRequestView({super.key});
  _buildBody() {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildApprovalSellersChecker(),
          SizedBox(height: 38.h),
          const CustomTitle(title: AppStrings.chooseTypeOfRequest),
          SizedBox(height: 20.h),
          PickRequestItem(
            height: 108.h,
            title: AppStrings.fastDelivery,
            description: AppStrings.fastDeliveryDescription,
          ),
          SizedBox(height: 20.h),
          PickRequestItem(
            height: 108.h,
            title: AppStrings.taxi,
            description: AppStrings.taxiDescription,
          ),
        ],
      ),
    );
  }

  _buildApprovalSellersChecker() {
    return Container(
      width: double.infinity,
      height: 62.h,
      decoration: BoxDecoration(
          color: ColorManager.black5,
          borderRadius: BorderRadius.all(Radius.circular(10.r))),
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Row(
          children: [
            Text(
              AppStrings.wantReieveFastRequsets,
              style: getRegularStyle(
                  color: ColorManager.darkGrey, fontSize: 15.sp),
            ),
            const Spacer(),
            const CustomSwitch(),
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
        title: AppStrings.fastRequest,
        actions: const [],
      ),
      body: _buildBody(),
    );
  }
}
