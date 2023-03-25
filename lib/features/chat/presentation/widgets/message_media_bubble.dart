import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:pip/core/resources/assets_manager.dart';
import 'package:pip/core/resources/color_manager.dart';

import '../../../../core/resources/commons.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../business_logic/chat_cubit.dart';
import '../../data/models/chats_messages_model.dart';

class MessageMediaBubble extends StatelessWidget {
  const MessageMediaBubble(
      {super.key, required this.chatMessage, required this.isMe});
  final ChatMessagesModel chatMessage;
  final bool isMe;
  _buildLocationBubble(BuildContext context) {
    return InkWell(
        onTap: () {
          BlocProvider.of<ChatCubit>(context).stopStream();
          List<String> result = chatMessage.message!.split(',');
          String gMapsUrl =
              'https://www.google.com/maps/search/?api=1&query=${result[1]},${result[2]}';
          Commons.openUrl(gMapsUrl);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.r),
          child: Container(
              height: 180.h,
              width: 230.w,
              // padding: EdgeInsets.all(8.w),
              decoration: const BoxDecoration(
                  // borderRadius: BorderRadius.circular(8.r),
                  ),
              child: CustomNetworkCachedImage(url: chatMessage.attachment)),
        ));
  }

  _buildPdf(BuildContext context) {
    return InkWell(
        onTap: () {
          BlocProvider.of<ChatCubit>(context).stopStream();
          Commons.openUrl(
              'http://docs.google.com/viewer?url=${chatMessage.attachment}');
          // Navigator.pushNamed(context, PdfViewerScreen.routeName,
          //     arguments: RouteArgument(param: chatMessage.attachment));
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                height: 50.h,
                width: 40.w,
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                    // color: ColorManager.white,
                    borderRadius: BorderRadius.circular(8.r)),
                child: Image.asset(ImageAssets.file)),
            const SizedBox(width: 10),
            Text(
              'PDF File',
              style: getRegularStyle(
                  fontSize: 14.sp, color: ColorManager.darkSeconadry),
            )
          ],
        ));
  }

  _buildVedioAndMusic(BuildContext context) {
    return InkWell(
        onTap: () {
          BlocProvider.of<ChatCubit>(context).stopStream();
          Commons.openUrl(chatMessage.attachment!);
          // Navigator.pushNamed(context, VideoScreen.routeName,
          //     arguments: RouteArgument(param: chatMessage.attachment));
        },
        child: Container(
            height: 50.h,
            width: 40.w,
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
                // color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(8.r)),
            child: const Icon(Icons.play_arrow_outlined, color: Colors.white)));
  }

  _buildImage(BuildContext context) {
    return FullScreenWidget(
      disposeLevel: DisposeLevel.Low,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.r),
        child: SizedBox(
            height: 120.h,
            width: 110.w,
            child: CustomNetworkCachedImage(url: chatMessage.attachment)),
      ),
    );
  }

  Widget _buildMessageMediaBubble(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          if (chatMessage.attachment != null) ...[
            if (chatMessage.message?.contains('location_type_message') ??
                false) ...[
              _buildLocationBubble(context),
            ] else if (chatMessage.attachment.toString().endsWith('.pdf')) ...[
              _buildPdf(context),
            ] else if (chatMessage.attachment.toString().endsWith('.mp3') ||
                chatMessage.attachment.toString().endsWith('.mp4')) ...[
              _buildVedioAndMusic(context)
            ] else ...[
              _buildImage(context),
            ]
          ],
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return _buildMessageMediaBubble(context);
  }
}
