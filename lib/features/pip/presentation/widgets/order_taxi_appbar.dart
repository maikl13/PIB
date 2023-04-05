import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/leading_arrow.dart';

class FastRequestAppBar extends StatelessWidget {
  const FastRequestAppBar({super.key,required this.title});
final String? title ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.h, right: 20.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const LeadingArrow(),
          SizedBox(width: 84.w),
          Text(title ??'',
              style:
                  getRegularStyle(fontSize: 20.sp, color: ColorManager.black))
        ],
      ),
    );
  }
}
