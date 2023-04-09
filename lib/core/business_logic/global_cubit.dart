import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:pip/features/menu/data/models/update_skill.dart';
import '../../features/chat/data/models/unread_messages_count.dart';
import '../../features/chat/data/repository/chat_repository.dart';

import '../../features/notification/data/models/unread_notification.dart';
import '../../features/notification/data/repository/notification_repository.dart';
import '../resources/constants.dart';
import '../web_services/network_exceptions.dart';
import 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState<dynamic>> {
  GlobalCubit(this.notificationRepository, this.chatRepository)
      : super(const GlobalState.idle());

  final NotificationRepository notificationRepository;
  final ChatRepository chatRepository;

  Stream<bool>? myStream;
  bool unreadMessage = false;
 
  StreamSubscription<bool>? subscription;

  Stream<int>? notificationStream;
  int notificationCount = 0;

  StreamSubscription<int>? notificationSubscription;

  void onMapLocationTapped(String address) {
    emit(GlobalState.myLoacationChange(address));
  }

  void onMapDestinationTapped(String address) {
    emit(GlobalState.myDestenationChange(address));
  }

  void startMessagesCountStream() async {
    myStream = Stream.periodic(const Duration(seconds: 10))
        .asyncMap((event) async => await getAllMessagesCount())
        .distinct();
    subscription = myStream?.listen((event) {
      if (event) {
        emit(GlobalState.newMessage(event));
      } 
    });
  }

  void startNotificationStream() async {
    notificationStream = Stream.periodic(const Duration(seconds: 10))
        .asyncMap((event) async => await getAllNotificationsCount())
        .distinct();
    notificationSubscription = notificationStream?.listen((event) {
      if (event != 0) {
        emit(GlobalState.getUnreadNotificationCountSuccess(event));

      
      } 
    });
  }

  void stopStream() {
    if (subscription != null) {
      subscription!.pause();
      subscription = null;
    }
    emit(const GlobalState.stopChatStreamState());
  }
  void stopNotificationStream() {
    if (notificationSubscription != null) {
      notificationSubscription!.pause();
      notificationSubscription = null;
    }
    emit(const GlobalState.stopNotificationStreamState());
  }

  Future<int> getAllNotificationsCount() async {
    emit(const GlobalState.getUnreadNotificationCountLoading());

    // ignore: prefer_typing_uninitialized_variables
    var result = await notificationRepository.getUnreadNotificationCount();
    result.when(
      success: (UnreadNotificationCount count) {
        notificationCount = count.unreadNotifications!;

        emit(GlobalState.getUnreadNotificationCountSuccess(count.unreadNotifications!));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(GlobalState.getUnreadNotificationCountError(networkExceptions));
      },
    );
    return notificationCount;
  }

  Future<bool> getAllMessagesCount() async {
    emit(const GlobalState.getUnreadMessagesCountLoading());

    // ignore: prefer_typing_uninitialized_variables
    var result = await chatRepository.getUnreadMessagesCount();
    result.when(
      success: (UnreadMessagesCount count) {
        unreadMessage = count.unreadCount!;
        emit(GlobalState.getUnreadMessagesCountSuccess(unreadMessage));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(GlobalState.getUnreadMessagesCountError(networkExceptions));
      },
    );
    return unreadMessage;
  }

  // void readMessage() {
  //   emit(GlobalState.readMessage(unreadMessage));
  // }

  Future<void> updateFcmToken(String? fcmToken) async {
    emit(const GlobalState.updateFcmLoading());

    // ignore: prefer_typing_uninitialized_variables
    var result = await notificationRepository.updateFcm(fcmToken);
    result.when(
      success: (UpdateSkill result) {
        emit(GlobalState.updateFcmSuccess(result));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(GlobalState.updateFcmError(networkExceptions));
      },
    );
  }

  changeSelectedIndex(int index) {
    // screenIndex = index;
    screenIndex = index;
    emit(GlobalState.selectedIndexChanged(index));
  }
}
