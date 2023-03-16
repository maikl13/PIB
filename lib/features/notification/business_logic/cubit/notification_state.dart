import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../data/models/notification_model.dart';
part 'notification_state.freezed.dart';

@freezed
class NotificationState<T> with _$NotificationState<T> {
  const factory NotificationState.idle() = Idle<T>;

  const factory NotificationState.loading() = Loading<T>;

  const factory NotificationState.success(List<NotifiticationModel> data) = Success<T>;

  const factory NotificationState.error(NetworkExceptions networkExceptions) =
      Error<T>;
}
