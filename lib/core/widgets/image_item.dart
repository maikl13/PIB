import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_network_image.dart';

import '../resources/color_manager.dart';
import '../resources/style_manager.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({super.key, required this.imageUrl});

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
            child: Container(
              width: 136.w,
              height: 85.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.r)),
              ),
              child: CustomNetworkCachedImage(url: imageUrl),
            ),
          ),
          SizedBox(height: 14.h),
          Text(imageUrl.split('/').last,
              style: getRegularStyle(fontSize: 14.sp, color: ColorManager.grey))
        ],
      ),
    );
  }
}
