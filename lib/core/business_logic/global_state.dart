import 'package:freezed_annotation/freezed_annotation.dart';

import '../../features/chat/data/models/unread_messages_count.dart';
import '../../features/menu/data/models/update_skill.dart';
import '../../features/notification/data/models/unread_notification.dart';
part 'global_state.freezed.dart';

@freezed
class GlobalState<T> with _$GlobalState<T> {
  const factory GlobalState.idle() = Idle<T>;

  const factory GlobalState.getUnreadNotificationCountLoading() = GetUnreadNotificationCountLoading<T>;
  const factory GlobalState.getUnreadNotificationCountSuccess(int count) = GetUnreadNotificationCountSuccess<T>;
  const factory GlobalState.getUnreadNotificationCountError(T data) = GetUnreadNotificationCountError<T>;

const factory GlobalState.selectedIndexChanged(int index) = SelectedIndexChanged<T>;


  const factory GlobalState.getUnreadMessagesCountLoading() = GetUnreadMessagesCountLoading<T>;
  const factory GlobalState.getUnreadMessagesCountSuccess(bool unreadMessage) = GetUnreadMessagesCountSuccess<T>;
  const factory GlobalState.getUnreadMessagesCountError(T data) = GetUnreadMessagesCountError<T>;

  const factory GlobalState.newMessage(bool newMessage) = NewMessage<T>;
  const factory GlobalState.readMessage(bool unread) = ReadMessage<T>;

  const factory GlobalState.stopChatStreamState() = StopChatStreamState<T>;
  const factory GlobalState.stopNotificationStreamState() = StopNotificationStreamState<T>;


  const factory GlobalState.myLoacationChange(String address) = MyLoacationChange<T>;
  const factory GlobalState.myDestenationChange(String address) = MyDestenationChange<T>;


  const factory GlobalState.updateFcmLoading() = UpdateFcmLoading<T>;
  const factory GlobalState.updateFcmSuccess(UpdateSkill data) = UpdateFcmSuccess<T>;
  const factory GlobalState.updateFcmError(T data) = UpdateFcmError<T>;

}
/* 


 */