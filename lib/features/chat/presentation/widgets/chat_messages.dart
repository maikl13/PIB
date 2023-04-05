import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/constants.dart';

import '../../../../core/widgets/loading_indicator.dart';
import '../../business_logic/chat_state.dart';
import 'message_media_bubble.dart';

import '../../business_logic/chat_cubit.dart';
import 'message_bubble.dart';

class ChatMessages extends StatefulWidget {
  const ChatMessages({Key? key, required this.chatId}) : super(key: key);

  final int chatId;

  @override
  State<ChatMessages> createState() => _ChatMessagesState();
}

class _ChatMessagesState extends State<ChatMessages>
    with WidgetsBindingObserver {
  final ScrollController _scrollController =
      ScrollController(initialScrollOffset: 22, keepScrollOffset: false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    BlocProvider.of<ChatCubit>(context).getAllChatMessages(widget.chatId);
        BlocProvider.of<ChatCubit>(context).startStream(widget.chatId);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    // BlocProvider.of<ChatCubit>(context).stopStream();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      BlocProvider.of<ChatCubit>(context).startStream(widget.chatId);
    } else if (state == AppLifecycleState.inactive) {
      BlocProvider.of<ChatCubit>(context)
          .stopStream(); // this is called when the app is in background
    } else if (state == AppLifecycleState.paused) {
      BlocProvider.of<ChatCubit>(context)
          .stopStream(); // this is called when the app is in background
    } else if (state == AppLifecycleState.inactive) {
      BlocProvider.of<ChatCubit>(context)
          .stopStream(); // this is called when the app is in background
    }
  }

  Widget _buildStream(int index) {
    final chatMessage = BlocProvider.of<ChatCubit>(context).allMessages[index];
    final isMe = chatMessage.senderId == defaultUId;
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: chatMessage.attachment == null || chatMessage.attachment == ''
          ? MessageBubble(
              message: chatMessage.message ?? '',
              date: chatMessage.time ?? '',
              isMe: isMe,
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MessageBubble(
                  message: chatMessage.message ?? '',
                  date: chatMessage.time ?? '',
                  isMe: isMe,
                ),
                SizedBox(height: 10.h),
                MessageMediaBubble(
                  chatMessage: chatMessage,
                  isMe: isMe,
                ),
              ],
            ),
    );
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.elasticOut);
    } else {
      Timer(const Duration(milliseconds: 400), () => _scrollToBottom());
    }
  }

  Widget _buildMessageList() {
    // goToLast();
    final allMessages = BlocProvider.of<ChatCubit>(context).allMessages;
    return ListView.builder(
      controller: _scrollController,

      padding: EdgeInsets.only(
        bottom: 50.h,
        right: 20.w,
        left: 20.w,
        top: 40.h,
      ),
      // reverse: true,
      shrinkWrap: true,
      itemCount: allMessages.length,
      itemBuilder: (context, index) => _buildStream(index),
    );
  }

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<ChatCubit>(context).startStream(widget.chatId);

    // goToLast();
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());

    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        state.whenOrNull(
          chatMessagesError: (networkExceptions) {
            // Commons.showToast(
            //   color: ColorManager.error,
            //   message: NetworkExceptions.getErrorMessage(networkExceptions),
            // );
          },
          stopChatStreamState: () {
            // BlocProvider.of<ChatCubit>(context).stopStream();
          },
          resumeChatStreamState: () {
            // BlocProvider.of<ChatCubit>(context).resumeStream(widget.chatId);
          },
        );
      },
      buildWhen: (previous, current) => current is ChatMessagesSuccess,
      builder: (context, state) {
        return state.maybeWhen(
          chatMessagesLoading: () {
            return const LoadingIndicator();
          },
          chatMessagesSuccess: (messages) {
            return _buildMessageList();
          },
          orElse: () => Container(),
        );
      },
    );
  }
}





  




/* 

 */