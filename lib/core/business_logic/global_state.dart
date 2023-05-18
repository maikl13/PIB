import 'package:freezed_annotation/freezed_annotation.dart';

import '../../features/notification/data/models/unread_notification.dart';
part 'global_state.freezed.dart';

@freezed
class GlobalState<T> with _$GlobalState<T> {
  const factory GlobalState.idle() = Idle<T>;

  const factory GlobalState.getUnreadNotificationCountLoading() = GetUnreadNotificationCountLoading<T>;
  const factory GlobalState.getUnreadNotificationCountSuccess(UnreadNotificationCount count) = GetUnreadNotificationCountSuccess<T>;
  const factory GlobalState.getUnreadNotificationCountError(T data) = GetUnreadNotificationCountError<T>;

}
/* 


 */