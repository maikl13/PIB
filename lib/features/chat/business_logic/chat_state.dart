import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/web_services/network_exceptions.dart';
part 'chat_state.freezed.dart';

@freezed
class ChatState<T> with _$ChatState<T> {
  const factory ChatState.idle() = Idle<T>;


  const factory ChatState.hiringChatsLoading() = HiringChatsLoading<T>;

  const factory ChatState.hiringChatsSuccess(T data) = HiringChatsSuccess<T>;

  const factory ChatState.hiringChatsError(NetworkExceptions networkExceptions) =
      HiringChatsError<T>;


       const factory ChatState.requestsChatsLoading() = RequestsChatsLoading<T>;

  const factory ChatState.requestsChatsSuccess(T data) = RequestsChatsSuccess<T>;

  const factory ChatState.requestsChatsError(NetworkExceptions networkExceptions) =
      RequestsChatsError<T>;


  const factory ChatState.sendMessageloading() = SendMessageLoading<T>;

  const factory ChatState.sendMessagesuccess(T data) = SendMessageSuccess<T>;

  const factory ChatState.sendMessageerror(NetworkExceptions networkExceptions) =
      SendMessageError<T>;

       const factory ChatState.messageloading() = MessageLoading<T>;

  const factory ChatState.messagesuccess(T data) = MessageSuccess<T>;

  const factory ChatState.messageerror(NetworkExceptions networkExceptions) =
      MessageError<T>;
}
