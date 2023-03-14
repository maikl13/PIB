import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';

import '../../../../core/resources/style_manager.dart';

class UploadedPhotos extends StatelessWidget {
  const UploadedPhotos({super.key});
  _buildPhoto() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: 136.w,
        height: 85.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                ColorManager.black.withOpacity(.3), BlendMode.darken),
            image: const AssetImage(ImageAssets.banner),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  _buildDeleteImageButton() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: 30.w,
        height: 30.h,
        decoration: BoxDecoration(
          color: ColorManager.white,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.close,
          size: 12.sp,
          color: ColorManager.darkSeconadry,
        ),
      ),
    );
  }

  _buildStack() {
    return SizedBox(
      width: 151.w,
      height: 95.h,
      // color: Colors.red,
      child: Stack(
        children: [
          _buildPhoto(),
          _buildDeleteImageButton(),
        ],
      ),
    );
  }

  _buildImageTitle() {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, top: 10.h),
      child: Text(
        'Image Title .png',
        style: getRegularStyle(fontSize: 15.sp, color: ColorManager.grey),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildStack(),
        _buildImageTitle(),
      ],
    );
  }
}
