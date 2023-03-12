import '../../../../core/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({Key? key, required this.title1, required this.title2}) : super(key: key);
  final String title1 ;
  final String title2 ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorManager.grey,
            width: .5,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 35.h),
        child: TabBar(
          // dividerColor: ColorManager.red,

          padding: EdgeInsets.zero,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 15.w),
          labelPadding: EdgeInsets.zero,
          indicatorColor: ColorManager.darkSeconadry,
          labelColor: ColorManager.darkSeconadry,
          indicatorWeight: 1.sp,
          unselectedLabelColor: ColorManager.grey,
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle:
              getRegularStyle(color: ColorManager.primary, fontSize: 14.sp),
          unselectedLabelStyle:
              getRegularStyle(color: ColorManager.grey, fontSize: 14.sp),
          tabs:  [
            Tab(text: title1),
            Tab(text:title2),
          ],
        ),
      ),
    );
  }
}
