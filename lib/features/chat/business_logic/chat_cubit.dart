import 'package:bloc/bloc.dart';
import 'package:pip/features/chat/data/models/hiring_chat_model.dart';


import '../../../core/web_services/network_exceptions.dart';
import '../data/repository/chat_repository.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.chatRepository) : super(const Idle());

  final ChatRepository chatRepository;
  // List<Allusermessage> allMessages = [];

  void getAllHiringChats() async {
        emit(const ChatState.hiringChatsLoading());

    var result = await chatRepository.getHiringChats();
    result.when(
      success: (List<HiringChatModel> hiringChats) {
        emit(ChatState.hiringChatsSuccess(hiringChats));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(ChatState.hiringChatsError(networkExceptions));
      },
    );
  }
    void getAllRequestsChats() async {
        emit(const ChatState.requestsChatsLoading());

    var result = await chatRepository.getHiringChats();
    result.when(
      success: (List<HiringChatModel> hiringChats) {
        emit(ChatState.requestsChatsSuccess(hiringChats));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(ChatState.requestsChatsError(networkExceptions));
      },
    );
  }

  // Stream<List<Allusermessage>> chatStream() async* {
  //   while (true) {
  //     await Future.delayed(const Duration(milliseconds: 500));
  //     List<Allusermessage> messagesModel = await getAllMessages();

  //     yield messagesModel;
  //   }
  // }

  // Future<List<Allusermessage>> getAllMessages() async {
  //   // ignore: prefer_typing_uninitialized_variables
  //   var result = await chatRepository.getAllMessages();
  //   result.when(
  //     success: (MessagesModel messages) {
  //       allMessages = messages.allreplymessage! + messages.allusermessage!;
  //       // print(allMessages.map((e) => e.name));

  //       emit(ChatState.messagesuccess(allMessages));
  //     },
  //     failure: (NetworkExceptions networkExceptions) {
  //       emit(ChatState.messageerror(networkExceptions));
  //     },
  //   );
  //   return allMessages;
  // }
}
