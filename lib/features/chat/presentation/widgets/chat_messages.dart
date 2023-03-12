import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/strings_manager.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import 'message_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding:
          EdgeInsets.only(bottom: 50.h, right: 20.w, left: 20.w, top: 40.h),
      reverse: true,
      children: [
        ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(height: 15.h);
          },
          // reverse: true,
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, index) {
            return MessageBubble(
              message: 'test this message',
              'استفسار بخصوص المياه البيضاء للعين',
              date: '12:00',
              isMe: index == 1 ? false : true,
            );
          },
        ),
        SizedBox(height: 20.h),
        Center(
          child: Text(
            AppStrings.today,
            style: getRegularStyle(color: ColorManager.grey, fontSize: 12.sp),
          ),
        ),
      ],
    );
    // return StreamBuilder(
    //   stream: FirebaseFirestore.instance
    //       .collection('chat')
    //       .orderBy(
    //         'time',
    //         descending: true,
    //       )
    //       .snapshots(),
    //   builder: (ctx, AsyncSnapshot<QuerySnapshot> chatSnapshot) {
    //     if (chatSnapshot.connectionState == ConnectionState.waiting) {
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    //     final chatDocs = chatSnapshot.data!.docs;
    //     return ListView.builder(
    //       reverse: true,
    //       itemCount: chatDocs.length,
    //       itemBuilder: (ctx, index) => MessageBubble(
    //         chatDocs[index]['name'],
    //         chatDocs[index]['text'],
    //         chatDocs[index]['name'] == 'marawanmoubark@gmail.com',
    //         key: ValueKey(chatDocs[index].id),
    //       ),
    //     );
    //   },
    // );
  }
}
