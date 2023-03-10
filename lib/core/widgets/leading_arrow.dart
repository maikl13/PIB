import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';

class LeadingArrow extends StatelessWidget {
  const LeadingArrow({super.key, this.leadingArrow});
  final Widget? leadingArrow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: leadingArrow ??
          Row(
            // mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              // SizedBox(width: 20.w),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: leadingArrow ??
                    Container(
                      width: 35.h,
                      height: 35.h,
                      decoration: BoxDecoration(
                        color: ColorManager.darkSeconadry,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: ColorManager.black,
                          // size: 20.sp,
                        ),
                      ),
                    ),
              ),
            ],
          ),
    );
  }
}
