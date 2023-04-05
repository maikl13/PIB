import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/color_manager.dart';
import '../resources/style_manager.dart';

import 'loading_indicator.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: ColorManager.black5,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const LoadingIndicator(),
          SizedBox(height: 16.h),
          Text("تم نشر طلبك بنجاح ويتم البحث عن سائق للتوصيل",
              style: getRegularStyle(fontSize: 19.sp, color: ColorManager.white),
              textAlign: TextAlign.center),


        ],
      ),
    );
  }
}
