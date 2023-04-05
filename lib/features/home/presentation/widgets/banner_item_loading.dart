import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/widgets/custom_image_view.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';

class BannerItemLoading extends StatelessWidget {
  const BannerItemLoading({Key? key}) : super(key: key);

  _buildBackGround() {
    return Stack(
      children: [
        Shimmer.fromColors(
         // baseColor: Colors.grey[300]!,
        //  highlightColor: Colors.grey[100]!,
          baseColor: Colors.white ,
          highlightColor: Colors.black12,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
          ),
        ),
        CustomImageView(
          svgPath: ImageAssets.shadow,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13.r),
      child: SizedBox(
        height: 180.h,
        width: 315.w,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildBackGround(),
            Padding(
              padding: EdgeInsets.only(right: 19.w, left: 69.w, bottom: 20.h),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.white ,
                      highlightColor: Colors.black12,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(left: 50),
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            height: 12,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          const SizedBox(height: 10),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
