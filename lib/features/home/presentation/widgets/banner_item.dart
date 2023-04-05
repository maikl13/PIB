import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/widgets/custom_image_view.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';

class BannerItem extends StatelessWidget {
  const BannerItem({super.key, this.imageUrl, this.title , this.content, this.urlLink});
  final String? imageUrl;
  final String? title;
  final String? content;
  final String? urlLink;

  _buildBackGround() {
    return Stack(

      children: [
        CustomNetworkCachedImage(url: imageUrl!),
        CustomImageView(svgPath: ImageAssets.shadow,width: double.infinity,height: double.infinity,fit: BoxFit.fill,)

      ],
    );
  }

  _buildTitle() {
    return Text(
      title??'',
      style: getBoldStyle(fontSize: 22.sp, color: ColorManager.white),
    );



  }

  _buildContent() {
    return Text(
      content??'',
      style: getRegularStyle(fontSize: 12.sp, color: ColorManager.white),
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
                  alignment: Alignment.bottomRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildTitle(),
                      _buildContent(),
                    ],
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
