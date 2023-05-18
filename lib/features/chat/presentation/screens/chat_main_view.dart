import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/constants.dart';
import 'package:pip/core/widgets/custom_network_image.dart';
import 'package:pip/features/chat/business_logic/chat_cubit.dart';
import 'package:pip/features/chat/business_logic/chat_state.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/leading_arrow.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../widgets/chat_messages.dart';

import '../widgets/new_message.dart';

class ChatView extends StatefulWidget {
  const ChatView({
    super.key,
    required this.chatId,
  });
  final int chatId;

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _buildBody(bool showAddOfferContainer) {
    return Column(
      children: [
        Expanded(
          child: ChatMessages(chatId: widget.chatId),
        ),
        NewMessage(
          showAddOfferContainer: showAddOfferContainer,
          chatId: widget.chatId,
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ChatCubit>(context).showChatInfo(widget.chatId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        state.whenOrNull(
          reportChatSuccess: (data) {
            Navigator.pop(context);
            Commons.showToast(
              message: "reportedSuccessfully",
              color: ColorManager.green,
            );
          },
        );
      },
      buildWhen: (previous, current) => current is ShowChatInfoSuccess,
      builder: (context, state) {
        return state.maybeWhen(
          showChatInfoLoading: () {
            return const LoadingIndicator();
          },
          showChatInfoSuccess: (chatInfo) {
            currentRequestId = chatInfo.request!.id.toString();
            return WillPopScope(
              onWillPop: () {
                BlocProvider.of<ChatCubit>(context).stopStream();
                BlocProvider.of<ChatCubit>(context).imagesFile.clear();
                return Future.value(true);
              },
              child: Scaffold(
                key: _scaffoldKey,
                appBar: AppBar(
                  backgroundColor: ColorManager.lightBlack,
                  leading: LeadingArrow(
                    onTap: () {
                      BlocProvider.of<ChatCubit>(context).stopStream();
                      BlocProvider.of<ChatCubit>(context).imagesFile.clear();

                      Navigator.pop(context);
                    },
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        child: ClipOval(
                          child: CustomNetworkCachedImage(
                              url: chatInfo.user!.imageUrl),
                        ),
                      ),
                      SizedBox(width: 14.w),
                      Text(
                        chatInfo.user!.name!.length < 10
                            ? chatInfo.user!.name!
                            : "${chatInfo.user!.name!.replaceRange(10, null, '')}...",
                        // chatInfo.user!.name ?? '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: getRegularStyle(
                            fontSize: 20.sp, color: ColorManager.white),
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
                        Commons.showChatSettingDialog(
                          context,
                          onReportTap: () {
                            BlocProvider.of<ChatCubit>(context)
                                .reportChat(widget.chatId.toString(), '');
                          },
                        );
                      },
                    ),
                  ],
                ),
                body: _buildBody(chatInfo.canSubmitOffer!),
              ),
            );
          },
          orElse: () => Container(),
        );
      },
    );
  }
}
