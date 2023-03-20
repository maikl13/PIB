import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/assets_manager.dart';
import 'package:pip/core/resources/color_manager.dart';
import 'package:pip/core/resources/route_manager.dart';
import 'package:pip/core/resources/strings_manager.dart';
import 'package:pip/core/resources/style_manager.dart';
import 'package:pip/core/widgets/custom_network_image.dart';

class ConversationItem extends StatelessWidget {
  const ConversationItem({super.key, this.name, this.totalMessage,  this.imageUrl});

  final String? name;
  final int ?totalMessage;
  final String ?imageUrl ;
  _buildBackground() {
    return Image.asset(
      ImageAssets.conversationItemBackground,
      fit: BoxFit.fill,
    );
  }

  Widget _buildAvatar() {
    return SizedBox(
        height: 60.w,
        width: 60.w,
        child: CircleAvatar(
          radius: 80.r,
          child:imageUrl ==null? Container() :  ClipOval(

            child: CustomNetworkCachedImage(url: imageUrl!),
          ),
        ));
  }

  _buildTitle(  ) {
    return Text(
      name ?? '',
      style: getBoldStyle(fontSize: 18.sp, color: ColorManager.darkSeconadry),
    );
  }

  _buildSubtitle( ) {
    return Text(
     "${AppStrings.totalMessage} ${totalMessage ?? 0}",
      style: getRegularStyle(fontSize: 12.sp, color: ColorManager.darkGrey),
    );
  }

  _buildArrow() {
    return Icon(
      Icons.arrow_forward,
      color: ColorManager.darkSeconadry,
      size: 16.sp,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          Routes.chatsViewRoute,
        );
      },
      child: SizedBox(
        width: double.infinity,
        height: 100.w,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Stack(
            fit: StackFit.expand,
            children: [
              _buildBackground(),
              Padding(
                padding: EdgeInsets.only(top: 20.w, right: 20.w, left: 20.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildAvatar(),
                    SizedBox(width: 20.w),
                    Padding(
                      padding: EdgeInsets.only(top: 4.w),
                      child: Column(
                        children: [
                          _buildTitle(),
                          SizedBox(height: 10.w),
                          _buildSubtitle(),
                        ],
                      ),
                    ),
                    const Spacer(),
                    _buildArrow(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
