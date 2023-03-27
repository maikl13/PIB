import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pip/core/resources/constants.dart';
import 'package:pip/features/chat/data/models/chat_with_user_model.dart';
import 'package:pip/features/chat/data/models/chats_messages_model.dart';
import 'package:pip/features/chat/data/models/job_chats_model.dart';
import 'package:pip/features/chat/data/models/show_chat_info_model.dart';
import 'package:pip/features/menu/data/models/update_skill.dart';
import '../../../core/resources/commons.dart';
import '../data/models/hiring_chat_model.dart';

import '../../../core/web_services/network_exceptions.dart';
import '../data/repository/chat_repository.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.chatRepository) : super(const Idle());

  final ChatRepository chatRepository;
  List<ChatMessagesModel> allMessages = [];
  StreamSubscription<List<ChatMessagesModel>>? subscription;
  Stream<List<ChatMessagesModel>>? myStream;
  StreamController<List<ChatMessagesModel>> streamController =
      StreamController<List<ChatMessagesModel>>.broadcast();

  void startStream(int chatId) async {
    myStream = Stream.periodic(const Duration(seconds: 1))
        .asyncMap((event) async => await getAllChatMessages(chatId));
    subscription = myStream?.listen((event) {
      allMessages = event;
    });
    // subscription = myStream.listen((data) {
    //   // handle stream data here
    // });
  }

  void stopStream() {
    if (subscription != null) {
      subscription!.pause();
      subscription = null;
    }
    emit(const ChatState.stopChatStreamState());
  }

  void resumeStream(int chatId) {
    if (subscription!.isPaused) {
      startStream(chatId);
    } else {
      // ignore: avoid_print
      print('object');
    }
    emit(const ChatState.resumeChatStreamState());

    // }
  }

  List<File> imagesFile = [];
  Future<void> getFile() async {
    try {
      emit(const ChatState.imageSelectedLoading());

      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc'],
      );
      if (result != null) {
        XFile xfile = XFile(result.files.single.path ?? '');
        imagesFile.add(File(xfile.path));
        emit(ChatState.imageSelectedSuccess(imagesFile));
      }
    } on PlatformException catch (e) {
      emit(const ChatState.imageSelectedError());
      Commons.showToast(message: e.toString());
      // print('Failed to pick image $e ');
    }
  }

  Future<void> getMultiMedia() async {
    try {
      emit(const ChatState.imageSelectedLoading());
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['mp3', 'mp4', 'jpg', 'png'],
      );

      if (result != null) {
        XFile xfile = XFile(result.files.single.path ?? '');
        imagesFile.add(File(xfile.path));
      }

      emit(ChatState.imageSelectedSuccess(imagesFile));
    } on PlatformException catch (e) {
      emit(const ChatState.imageSelectedError());
      Commons.showToast(message: e.toString());
      // print('Failed to pick image $e ');
    }
  }

  Future pickImageFromCamera(int chatId) async {
    try {
      emit(const ChatState.imageSelectedLoading());

      final XFile? image =
          await ImagePicker().pickImage(source: ImageSource.camera);

      imagesFile.add(File(image!.path));

      emit(ChatState.imageSelectedSuccess(imagesFile));
      // startStream(chatId);
    } on PlatformException catch (e) {
      emit(const ChatState.imageSelectedError());
      Commons.showToast(message: e.toString());
      // print('Failed to pick image $e ');
    }
  }

  deleteImage(int index) {
    imagesFile.removeAt(index);
  }

  void onReorder(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final item = imagesFile.removeAt(oldIndex);
    imagesFile.insert(newIndex, item);

    emit(ChatState.imageSelectedDeleted(imagesFile));
  }

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

    var result = await chatRepository.getRequestsChats();
    result.when(
      success: (List<HiringChatModel> requestChats) {
        emit(ChatState.requestsChatsSuccess(requestChats));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(ChatState.requestsChatsError(networkExceptions));
      },
    );
  }

  void getAllJobChats(int chatId) async {
    emit(const ChatState.jobChatsLoading());

    var result = await chatRepository.getAllJobsChats(chatId);
    result.when(
      success: (JobChatsModel jobChats) {
        emit(ChatState.jobChatsSuccess(jobChats));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(ChatState.jobChatsError(networkExceptions));
      },
    );
  }

  void showChatInfo(int chatId) async {
    emit(const ChatState.showChatInfoLoading());

    var result = await chatRepository.getChatInfo(chatId);
    result.when(
      success: (ShowChatInfoModel chatInfo) {
        emit(ChatState.showChatInfoSuccess(chatInfo));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(ChatState.showChatInfoError(networkExceptions));
      },
    );
  }

  Future<List<ChatMessagesModel>> getAllChatMessages(int chatId) async {
    emit(const ChatState.chatMessagesLoading());

    var result = await chatRepository.getAllChatMessages(chatId);
    result.when(
      success: (List<ChatMessagesModel> messages) {
        emit(ChatState.chatMessagesSuccess(messages));
        allMessages = messages;
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(ChatState.chatMessagesError(networkExceptions));
      },
    );
    return allMessages;
  }

  // Stream<List<ChatMessagesModel>> chatStream(int chatId) async* {
  //   while (true) {
  //     await Future.delayed(const Duration(milliseconds: 5000));
  //     List<ChatMessagesModel> messages = await getAllChatMessages(chatId);

  //     yield messages;
  //   }
  // }

  void sendMessage(
    String chatId,
    String? message, {
    File? attachment,
  }) async {
    emit(const ChatState.sendMessageloading());
    var result = await chatRepository.sendMessage(
        chatId,
        message!,
        // ignore: prefer_if_null_operators
        attachment == null
            ? imagesFile.isEmpty
                ? null
                : imagesFile[0]
            : attachment);
    result.when(
      success: (UpdateSkill data) {
        imagesFile.clear();
        // resumeStream(int.parse(chatId));
        emit(ChatState.sendMessagesuccess(data));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(ChatState.sendMessageerror(networkExceptions));
      },
    );
  }

  void reportChat(
    String chatId,
    String comment,
  ) async {
    emit(const ChatState.reportChatLoading());

    var result = await chatRepository.reportChat(chatId, comment);
    result.when(
      success: (UpdateSkill data) {
        emit(ChatState.reportChatSuccess(data));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(ChatState.requestsChatsError(networkExceptions));
      },
    );
  }

  void chatWithUser({
    required String requestId,
    required String targetId,
  }) async {
    emit(const ChatState.chatWithUserLoading());

    var result = await chatRepository.chatWithUser(requestId, targetId);
    result.when(
      success: (ChatWithUserModel data) {
        currentRequestId = requestId;
        emit(ChatState.chatWithUserSuccess(data));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(ChatState.chatWithUserError(networkExceptions));
      },
    );
  }
}
