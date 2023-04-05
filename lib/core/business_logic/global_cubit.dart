import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:pip/features/chat/data/models/unread_messages_count.dart';
import 'package:pip/features/chat/data/repository/chat_repository.dart';

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

  Stream<int>? myStream;
  int messagesCount = 0;
  int newMessagesCount = 0;
  StreamSubscription<int>? subscription;

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
      if (newMessagesCount == 0 || newMessagesCount != event) {
        newMessagesCount = event;
      } else {
        emit(GlobalState.newMessage(event));
        newMessagesCount = event;
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

  Future<int> getAllMessagesCount() async {
    emit(const GlobalState.getUnreadMessagesCountLoading());

    // ignore: prefer_typing_uninitialized_variables
    var result = await chatRepository.getUnreadMessagesCount();
    result.when(
      success: (UnreadMessagesCount count) {
        messagesCount = count.unreadCount!;
        emit(GlobalState.getUnreadMessagesCountSuccess(count));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(GlobalState.getUnreadMessagesCountError(networkExceptions));
      },
    );
    return messagesCount;
  }

  void readMessage() {
    emit(GlobalState.readMessage(newMessagesCount));
  }

  changeSelectedIndex(int index) {
    // screenIndex = index;
    screenIndex = index;
    emit(GlobalState.selectedIndexChanged(index));
  }
}
