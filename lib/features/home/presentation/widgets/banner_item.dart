import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/commons.dart';
import 'package:pip/core/widgets/custom_network_image.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';

class BannerItem extends StatelessWidget {
  const BannerItem({super.key, this.imageUrl, this.title, this.urlLink});
  final String? imageUrl;
  final String? title;
  final String? urlLink;

  _buildBackGround() {
    return ColorFiltered(
        colorFilter: ColorFilter.mode(
            ColorManager.black.withOpacity(.4), BlendMode.darken),
        child:  CustomNetworkCachedImage(url: imageUrl!));
  }

  _buildTitle() {
    return Text(
      title??'',
      style: getBoldStyle(fontSize: 22.sp, color: ColorManager.white),
    );
  }

  // _buildSubtitle() {
  //   return Text(
  //   desc,
  //     style: getRegularStyle(
  //         fontSize: 12.sp, color: ColorManager.white.withOpacity(.8)),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13.r),
      child: InkWell(
        onTap: () {
          Commons.openUrl(urlLink??'www.google.com');
        },
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
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 229.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildTitle(),
                        // _buildSubtitle(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
