import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    required this.message,
    required this.date,
    required this.isMe,
    Key? key,
  }) : super(key: key);

  final String message;
  final String date;
  final bool isMe;

  // _buildUserAvatar() {
  //   return SizedBox(
  //     height: 27.w,
  //     width: 27.w,
  //     child: CircleAvatar(
  //       radius: 33.r,
  //       backgroundImage: const AssetImage(ImageAssets.banner),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return (message == '' || message.contains('location_type_message'))
        ? Container()
        : Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // _buildUserAvatar(),
              // SizedBox(height: 12.h),
              Row(
                mainAxisAlignment:
                    isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  Container(
                    width: 243.w,
                    height: 47.h,
                    decoration: BoxDecoration(
                      color: isMe ? ColorManager.black5 : ColorManager.white,
                      borderRadius: BorderRadius.only(
                        topLeft:
                            isMe ? Radius.circular(0.r) : Radius.circular(20.r),
                        topRight:
                            isMe ? Radius.circular(20.r) : Radius.circular(0.r),
                        bottomLeft: Radius.circular(20.r),
                        bottomRight: Radius.circular(20.r),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        message,
                        style: getRegularStyle(
                            color:
                                isMe ? ColorManager.white : ColorManager.black,
                            fontSize: 14.sp),
                        textAlign: isMe ? TextAlign.end : TextAlign.start,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
  }
}
