import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/assets_manager.dart';
import 'package:pip/core/resources/color_manager.dart';
import 'package:pip/core/resources/commons.dart';
import 'package:pip/core/resources/strings_manager.dart';
import 'package:pip/core/resources/style_manager.dart';
import 'package:pip/core/widgets/custom_appbar.dart';
import 'package:pip/core/widgets/leading_arrow.dart';
import 'package:pip/features/chat/presentation/widgets/chat_messages.dart';

import '../widgets/new_message.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  _buildBody() {
    return Column(
      children: const [
        Expanded(
          child: Messages(),
        ),
        NewMessage(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.lightBlack,
        leading: const LeadingArrow(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(ImageAssets.banner),
            ),
            SizedBox(width: 14.w),
            Text(
              AppStrings.userName,
              style:
                  getRegularStyle(fontSize: 20.sp, color: ColorManager.white),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              size: 18.sp,
            ),
            onPressed: () {
              Commons.showChatSettingDialog(context);
            },
          ),
        ],
      ),
      body: _buildBody(),
    );
  }
}
