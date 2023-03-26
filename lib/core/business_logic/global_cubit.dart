import 'package:bloc/bloc.dart';

import '../../features/notification/data/models/unread_notification.dart';
import '../../features/notification/data/repository/notification_repository.dart';
import '../web_services/network_exceptions.dart';
import 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState<dynamic>> {
  GlobalCubit(this.notificationRepository) : super(const GlobalState.idle());

  final NotificationRepository notificationRepository;
  void getAllNotificationsCount() async {
    emit(const GlobalState.getUnreadNotificationCountLoading());

    // ignore: prefer_typing_uninitialized_variables
    var result = await notificationRepository.getUnreadNotificationCount();
    result.when(
      success: (UnreadNotificationCount count) {
        emit(GlobalState.getUnreadNotificationCountSuccess(count));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(GlobalState.getUnreadNotificationCountError(networkExceptions));
      },
    );
  }
}
