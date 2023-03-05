import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';
import '../resources/style_manager.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key,  this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'لا يوجد بيانات لعرضها',
        style:
            getBoldStyle(color: color ?? ColorManager.white, fontSize: 22.sp),
      ),
    );
  }
}
