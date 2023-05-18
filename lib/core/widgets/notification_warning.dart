import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';

class NotificationWarning extends StatelessWidget {
  const NotificationWarning({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
                          width: 7.w,
                          height: 7.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorManager.red,
                          ),
                        );
  }
}