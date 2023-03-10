import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';

class ImageWithRating extends StatelessWidget {
  const ImageWithRating({super.key});
  _buildImage() {
    return Stack(
      // fit: StackFit.expand,
      children: [
        SizedBox(
          width: 80.w,
          height: 70.h,
          // color: Colors.amber,
        ),
        _buildJobImage(),
        _buildJobRate(),
      ],
    );
  }

  _buildJobImage() {
    return SizedBox(
      width: 70.w,
      height: 70.w,
      child: CircleAvatar(
        radius: 50.r,
        backgroundImage: const AssetImage(
          ImageAssets.banner,
        ),
      ),
    );
    // return Container(
    //   width: 70.w,
    //   height: 70.h,
    //   decoration: BoxDecoration(
    //     shape: BoxShape.circle,
    //   ),
    //   // color: Colors.red,
    //   child: Image.asset(
    //     ImageAssets.banner,
    //     height: 70.h,
    //     width: 70.w,
    //     fit: BoxFit.fill,
    //   ),
    // );
  }

  _buildJobRate() {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
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
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildImage();
  }
}
