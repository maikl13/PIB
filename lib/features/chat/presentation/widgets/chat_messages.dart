import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/core/resources/constants.dart';

import 'package:pip/core/widgets/loading_indicator.dart';
import 'package:pip/features/chat/business_logic/chat_state.dart';
import 'package:pip/features/chat/presentation/widgets/message_media_bubble.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/commons.dart';
import '../../../../core/web_services/network_exceptions.dart';
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
  Widget _buildStream() {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.only(
                bottom: 50.h, right: 20.w, left: 20.w, top: 40.h),
            separatorBuilder: (context, index) {
              return SizedBox(height: 15.h);
            },
            reverse: false,
            shrinkWrap: true,
            itemCount: BlocProvider.of<ChatCubit>(context).allMessages.length,
            itemBuilder: (context, index) {
              if (BlocProvider.of<ChatCubit>(context)
                          .allMessages[index]
                          .attachment ==
                      null ||
                  BlocProvider.of<ChatCubit>(context)
                          .allMessages[index]
                          .attachment ==
                      '') {
                return _buildTextBubble(index);
              } else if (BlocProvider.of<ChatCubit>(context)
                          .allMessages[index]
                          .attachment !=
                      null &&
                  (BlocProvider.of<ChatCubit>(context)
                              .allMessages[index]
                              .message !=
                          null ||
                      BlocProvider.of<ChatCubit>(context)
                              .allMessages[index]
                              .message !=
                          '')) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextBubble(index),
                    SizedBox(height: 10.h),
                    _buildMediaBubble(index),
                  ],
                );
              } else {
                return _buildMediaBubble(index);
              }
            },
          ),
        ),
      ],
    );
  }

  _buildTextBubble(int index) {
    return MessageBubble(
      message:
          BlocProvider.of<ChatCubit>(context).allMessages[index].message ?? '',
      date: BlocProvider.of<ChatCubit>(context).allMessages[index].time ?? '',
      isMe: BlocProvider.of<ChatCubit>(context).allMessages[index].senderId ==
              defaultUId
          ? true
          : false,
    );
  }

  _buildMediaBubble(int index) {
    return MessageMediaBubble(
        chatMessage: BlocProvider.of<ChatCubit>(context).allMessages[index],
        isMe: BlocProvider.of<ChatCubit>(context).allMessages[index].senderId ==
                defaultUId
            ? true
            : false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        state.whenOrNull(
          chatMessagesError: (networkExceptions) {
                Commons.showToast(
              color: ColorManager.error,
              message: NetworkExceptions.getErrorMessage(networkExceptions),
            );
          },
          stopChatStreamState: () {
            BlocProvider.of<ChatCubit>(context).stopStream();
          },
          resumeChatStreamState: () {
            BlocProvider.of<ChatCubit>(context).resumeStream(widget.chatId);
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
            return _buildStream();
          },
          orElse: () => Container(),
        );
      },
    );
  }

  @override
  void initState() {
    BlocProvider.of<ChatCubit>(context).getAllChatMessages(widget.chatId);
    BlocProvider.of<ChatCubit>(context).startStream(widget.chatId);
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      BlocProvider.of<ChatCubit>(context).startStream(widget.chatId);
    } else if (state == AppLifecycleState.inactive) {
      BlocProvider.of<ChatCubit>(context).stopStream();
    }
  }

  @override
  void dispose() {
    // BlocProvider.of<ChatCubit>(context).stopStream();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}





  




/* 

 */