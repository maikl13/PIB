import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';

class DefaultBackArrow extends StatelessWidget {
  const DefaultBackArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.arrow_back_ios_new,
      size: 20.sp,
      color: ColorManager.grey,
    );
  }
}
