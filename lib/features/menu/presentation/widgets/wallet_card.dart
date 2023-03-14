import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../notification/presentation/widgets/clock_date.dart';
import 'charge_wallet_button.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({super.key, required this.totalBalance, required this.date});

  final String totalBalance;
  final String date;

  _buildAmount() {
    return Text(
      "90000 \$",
      style: getBoldStyle(fontSize: 40.sp, color: ColorManager.white),
    );
  }

  _buildHint() {
    return Text(
      AppStrings.currentBalance,
      style: getLightStyle(fontSize: 14.sp, color: ColorManager.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 199.h,
      decoration: BoxDecoration(
          border: Border.all(color: ColorManager.darkGrey),
          color: ColorManager.lightBlack,
          borderRadius: BorderRadius.all(Radius.circular(20.r))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildAmount(),
          SizedBox(height: 8.h),
          _buildHint(),
          SizedBox(height: 29.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClockDate(color: ColorManager.grey),
                const ChargeWalletButton(),
                // SizedBox(width: 68.w, child: ClockDate(color: ColorManager.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
