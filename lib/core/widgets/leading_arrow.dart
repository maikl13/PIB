import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/assets_manager.dart';

import '../resources/color_manager.dart';

class LeadingArrow extends StatelessWidget {
  const LeadingArrow({super.key, this.leadingArrow, this.onTap});
  final Widget? leadingArrow;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: leadingArrow ??
          Row(
            // mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              // SizedBox(width: 20.w),
              InkWell(
                onTap: onTap ?? () => Navigator.pop(context),
                child: leadingArrow ??
                    Container(
                      // margin: EdgeInsets.all(8.r),
                      width: 35.h,
                      height: 35.h,
                      decoration: BoxDecoration(
                        color: ColorManager.darkSeconadry,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Image.asset(
                        ImageAssets.leading,
                        fit: BoxFit.contain,
                      ),
                    ),
              ),
            ],
          ),
    );
  }
}
