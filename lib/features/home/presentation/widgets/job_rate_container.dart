import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';

class JobRateContainer extends StatelessWidget {
  const JobRateContainer({super.key});

  _buildJobRate() {
    return  Container(
          width: 49.w,
          height: 19.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r), color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '04',
                style: TextStyle(fontSize: 10.sp),
              ),
              SizedBox(
                width: 5.w,
              ),
              Icon(
                Icons.star,
                color: ColorManager.darkSeconadry,
                size: 11.sp,
              ),
            ],
          ),
        );
      
  }

  @override
  Widget build(BuildContext context) {
    return _buildJobRate();
  }
}
