import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/strings_manager.dart';
import 'package:pip/core/widgets/custom_appbar.dart';
import 'package:pip/core/widgets/custom_title.dart';
import 'package:pip/features/chat/presentation/widgets/chats_item.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  _buildBody() {
    return ListView(
      padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),

      shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
      children: [
        const CustomTitle(title: AppStrings.chatsTitle),
        SizedBox(height: 20.h),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          separatorBuilder: (context, index) {
            return SizedBox(height: 10.h);
          },
          itemBuilder: (context, index) {
            return const ChatsItem();
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.chatAppbar,
        actions: [],
      ),
      body: _buildBody(),
    );
  }
}
