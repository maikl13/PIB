import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/style_manager.dart';

class ClockDate extends StatelessWidget {
  const ClockDate({super.key, required this.color, this.date});
  final Color color;
  final String? date;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(
          Icons.access_time,
          color: color,
          size: 13.sp,
        ),
        SizedBox(width: 10.w),
        Text(
         date?? "23-2-2021",
          style: getRegularStyle(color: color, fontSize: 11.sp),
        )
      ],
    );
  }
}
