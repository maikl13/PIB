import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_network_image.dart';

class ImageWithRating extends StatelessWidget {
  const ImageWithRating({super.key, this.height, this.image});
  final double? height;
  final String? image;
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
        // Positioned.fill(
        //   child: Align(
        //       alignment: Alignment.bottomLeft,
        //       child: JobRateContainer(
        //         height: height,
        //       )),
        // ),
      ],
    );
  }

  _buildJobImage() {
    return SizedBox(
      width: 70.w,
      height: 70.w,
      child: CircleAvatar(
        radius: 50.r,
        child: ClipOval(child: CustomNetworkCachedImage(url: image)),
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

  @override
  Widget build(BuildContext context) {
    return _buildImage();
  }
}
