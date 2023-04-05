import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../notification/presentation/widgets/clock_date.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';

class TransactionItem extends StatelessWidget {
  final String amount;
  final String date;
  final String type;

  const TransactionItem({
    super.key,
    required this.amount,
    required this.date,
    required this.type,

    // this.onTap,
  });

  // final void Function()? onTap;

  Widget _buildLeading(BuildContext context) {
    return SizedBox(
      height: 55.h,
      width: 55.w,
      child: CircleAvatar(
        radius: 40.r,
        backgroundColor: ColorManager.darkSeconadry,
        child: Center(
          child: Image.asset(
            ImageAssets.wallet,
            width: 20.w,
            height: 20.h,
            color: ColorManager.white,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          type,
          style: getBoldStyle(color: ColorManager.white, fontSize: 18.sp),
        ),
        SizedBox(height: 8.h),
        ClockDate(
          color: ColorManager.grey,
          date: date,
        )
      ],
    );
  }

  Widget _buildTrailing(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Text(
          '\$ $amount',
          style:
              getBoldStyle(color: ColorManager.darkSeconadry, fontSize: 25.sp),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96.h,
      width: double.infinity,
      child: ListTile(
        contentPadding:
            EdgeInsets.only(top: 22.h, right: 15.w, left: 20.w, bottom: 20.h),
        dense: true,
        horizontalTitleGap: 20.w,
        tileColor: ColorManager.black5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        leading: _buildLeading(context),
        title: _buildTitle(),
        trailing: _buildTrailing(context),
      ),
    );
  }
}
