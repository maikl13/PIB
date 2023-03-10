import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/strings_manager.dart';
import 'package:pip/core/widgets/custom_title.dart';

import '../widgets/pick_request_item.dart';

class PickRequestTypeView extends StatelessWidget {
  const PickRequestTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTitle(title: AppStrings.chooseRequestType),
          SizedBox(height: 20.h),
          const PickRequestItem(title: AppStrings.fastRequest),
          SizedBox(height: 20.h),
          const PickRequestItem(title: AppStrings.specialRequest),
        ],
      ),
    );
  }
}
