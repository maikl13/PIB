import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/business_logic/global_cubit.dart';
import 'package:pip/core/widgets/custom_network_image.dart';
import 'package:pip/features/chat/data/models/job_chats_model.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/route_manager.dart';

class ChatsItem extends StatelessWidget {
  const ChatsItem({super.key, required this.index, required this.jobChats});

  final int index;
  final JobChatsModel jobChats;
  _buildBackground() {
    return Image.asset(
      ImageAssets.flibBackground,
      fit: BoxFit.fill,
    );
  }

  Widget _buildAvatar() {
    return Padding(
      padding: EdgeInsets.only(top: 8.w),
      child: SizedBox(
          height: 60.w,
          width: 60.w,
          child: CircleAvatar(
            radius: 80.r,
            child: ClipOval(
                child: CustomNetworkCachedImage(
                    url: jobChats.chats![index].user!.imageUrl)),
          )),
    );
  }

  _buildTitle() {
    return Text(
      maxLines: 1,
      overflow: TextOverflow.clip,
      jobChats.chats![index].user!.name!.length > 15
          ? jobChats.chats![index].user!.name!.replaceRange(8, null, '...')
          : jobChats.chats![index].user!.name ?? '',
      softWrap: true,
      style: getBoldStyle(fontSize: 18.sp, color: ColorManager.darkSeconadry),
    );
  }

  _buildSubtitle() {
    return SizedBox(
      width: 120.w,
      child: Text(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        jobChats.chats![index].lastMessage ?? '',
        style: getRegularStyle(fontSize: 12.sp, color: ColorManager.darkGrey),
      ),
    );
  }

  _buildArrow() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            jobChats.chats![index].lastMessageTime!,
            style: getRegularStyle(fontSize: 11.sp, color: ColorManager.grey),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Image.asset(
              ImageAssets.rightArrow,
              width: 16.w,
              height: 16.h,
              color: ColorManager.darkSeconadry,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<GlobalCubit>(context).readMessage();
        Navigator.pushNamed(context, Routes.chatViewRoute, arguments: {
          'chatId': jobChats.chats![index].id,
        });
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
                padding: EdgeInsets.only(top: 15.w, right: 15.w, left: 12.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildAvatar(),
                    SizedBox(width: 20.w),
                    Padding(
                      padding: EdgeInsets.only(top: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTitle(),
                          SizedBox(height: 10.sp),
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
