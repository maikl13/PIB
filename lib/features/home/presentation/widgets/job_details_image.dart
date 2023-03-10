import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';

class JobDetailsImage extends StatelessWidget {
  const JobDetailsImage({super.key});

  _buildImage() {
    return Stack(
      fit: StackFit.loose,
      children: [
        SizedBox(
          width: 170.w,
          height: 150.h,
          // color: Colors.amber,
        ),
        _buildJobImage(),
        _buildJobRate(),
      ],
    );
  }

  _buildJobImage() {
    return SizedBox(
      width: 150.w,
      height: 150.w,
      child: CircleAvatar(
        radius: 80.r,
        backgroundImage: const AssetImage(
          ImageAssets.banner,
        ),
      ),
    );
    // return SizedBox(
    //   width: 150.w,
    //   height: 150.h,
    //   // color: Colors.red,
    //   child: ClipOval(
    //       child: ColorFiltered(
    //     colorFilter:
    //         ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
    //     child: Image.asset(
    //       ImageAssets.banner,
    //       height: 70.h,
    //       width: 70.w,
    //       fit: BoxFit.fill,
    //     ),
    //   )),
    // );
  }

  _buildJobRate() {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          width: 78.w,
          height: 25.w,
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
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildImage();
  }
}
