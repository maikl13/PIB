import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/style_manager.dart';

class MyActionSheet extends StatelessWidget {
  const MyActionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: [
        Container(
          color: ColorManager.white,
          height: 63.h,
          child: CupertinoActionSheetAction(
            isDestructiveAction: false,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              AppStrings.report,
              style:
                  getRegularStyle(color: ColorManager.black, fontSize: 16.sp),
            ),
          ),
        ),
        // CupertinoActionSheetAction(
        //   // isDefaultAction: true,
        //   onPressed: () {},
        //   child: const BottomSheetItem(title: AppStrings.transaferProgressing),
        // ),
        // CupertinoActionSheetAction(
        //   // isDefaultAction: true,
        //   onPressed: () {},
        //   child: const BottomSheetItem(title: AppStrings.onRoad, choosen: true),
        // ),
        // CupertinoActionSheetAction(
        //   // isDefaultAction: true,
        //   onPressed: () {
        //     //     showCupertinoModalPopup(
        //     //   context: context,
        //     //   builder: (context) {
        //     //     return const OrderCancelBottomSheet();
        //     //   },
        //     // );
        //   },
        //   child: const BottomSheetItem(title: AppStrings.orderCancel),
        // ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () => Navigator.pop(context),
        child: Text(
          AppStrings.cancel,
          style: getBoldStyle(
              color: Theme.of(context).primaryColor, fontSize: 18.sp),
        ),
        // isDestructiveAction: true,
      ),
    );
  }
}
