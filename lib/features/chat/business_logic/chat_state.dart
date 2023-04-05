import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pip/features/chat/data/models/chats_messages_model.dart';
import 'package:pip/features/chat/data/models/job_chats_model.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../data/models/chat_with_user_model.dart';
import '../data/models/show_chat_info_model.dart';
part 'chat_state.freezed.dart';

@freezed
class ChatState<T> with _$ChatState<T> {
  const factory ChatState.idle() = Idle<T>;

const factory ChatState.goToLocation() = GoToLocation<T>;
const factory ChatState.stopChatStreamState() = StopChatStreamState<T>;
const factory ChatState.resumeChatStreamState() = ResumeChatStreamState<T>;
const factory ChatState.startChatStreamState(List<ChatMessagesModel> messages) = StartChatStreamState<T>;

  const factory ChatState.chatStreamNewData(List<ChatMessagesModel> messages) = ChatStreamNewData<T>;


  const factory ChatState.hiringChatsLoading() = HiringChatsLoading<T>;


  const factory ChatState.hiringChatsSuccess(T data) = HiringChatsSuccess<T>;

  const factory ChatState.hiringChatsError(NetworkExceptions networkExceptions) =
      HiringChatsError<T>;


 const factory ChatState.chatWithUserLoading() = ChatWithUserLoading<T>;

  const factory ChatState.chatWithUserSuccess(ChatWithUserModel data) = ChatWithUserSuccess<T>;

  const factory ChatState.chatWithUserError(NetworkExceptions networkExceptions) =
      ChatWithUserError<T>;



      const factory ChatState.reportChatLoading() = ReportChatLoading<T>;

  const factory ChatState.reportChatSuccess(T data) = ReportChatSuccess<T>;

  const factory ChatState.reportChatError(NetworkExceptions networkExceptions) =
      ReportChatError<T>;


       const factory ChatState.requestsChatsLoading() = RequestsChatsLoading<T>;

  const factory ChatState.requestsChatsSuccess(T data) = RequestsChatsSuccess<T>;

  const factory ChatState.requestsChatsError(NetworkExceptions networkExceptions) =
      RequestsChatsError<T>;


           const factory ChatState.jobChatsLoading() = JobChatsLoading<T>;

  const factory ChatState.jobChatsSuccess(JobChatsModel jobChats) = JobChatsSuccess<T>;

  const factory ChatState.jobChatsError(NetworkExceptions networkExceptions) =
      JobChatsError<T>;




           const factory ChatState.showChatInfoLoading() = ShowChatInfoLoading<T>;

  const factory ChatState.showChatInfoSuccess(ShowChatInfoModel chatInfo) = ShowChatInfoSuccess<T>;

  const factory ChatState.showChatInfoError(NetworkExceptions networkExceptions) =
      ShowChatInfoError<T>;






       const factory ChatState.chatMessagesLoading() = ChatMessagesLoading<T>;

  const factory ChatState.chatMessagesSuccess(List<ChatMessagesModel> messages) = ChatMessagesSuccess<T>;

  const factory ChatState.chatMessagesError(NetworkExceptions networkExceptions) =
      ChatMessagesError<T>;


    const factory ChatState.imageSelectedSuccess(List<File> images) =
      ImageSelectedSuccess<T>;

  const factory ChatState.imageSelectedLoading() = ImageSelectedLoading<T>;
  const factory ChatState.imageSelectedError() = ImageSelectedError<T>;
  const factory ChatState.imageSelectedDeleted(List<File> images) =
      ImageSelectedDeleted<T>;





    const factory ChatState.fileSelectedSuccess(List<File> files) =
      FileSelectedSuccess<T>;

  const factory ChatState.fileSelectedLoading() = FileSelectedLoading<T>;
  const factory ChatState.fileSelectedError() = FileSelectedError<T>;
  const factory ChatState.fileSelectedDeleted(List<File> files) =
      FileSelectedDeleted<T>;



  const factory ChatState.sendMessageloading() = SendMessageLoading<T>;

  const factory ChatState.sendMessagesuccess(T data) = SendMessageSuccess<T>;

  const factory ChatState.sendMessageerror(NetworkExceptions networkExceptions) =
      SendMessageError<T>;

       const factory ChatState.messageloading() = MessageLoading<T>;

  const factory ChatState.messagesuccess(T data) = MessageSuccess<T>;

  const factory ChatState.messageerror(NetworkExceptions networkExceptions) =
      MessageError<T>;
}
