import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';
import '../resources/style_manager.dart';

class BottomSheetItem extends StatelessWidget {
  const BottomSheetItem({super.key, required this.title, this.choosen = false});
  final String title;
  final bool? choosen;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: getRegularStyle(
                  color: choosen! ? Colors.blue : ColorManager.black,
                  fontSize: 16.sp),
            ),
            Visibility(
              visible: choosen ?? false,
              child: const Icon(
                Icons.check,
                color: Colors.blue,
              ),
            )
          ],
        ));
  }
}
