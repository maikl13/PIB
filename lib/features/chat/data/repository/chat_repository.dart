import 'dart:io';

import 'package:pip/features/chat/data/models/chats_messages_model.dart';
import 'package:pip/features/chat/data/models/unread_messages_count.dart';
import 'package:pip/features/menu/data/models/update_skill.dart';

import '../../../../core/resources/constants.dart';
import '../../../../core/web_services/api_result.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/web_services/web_services.dart';
import '../models/chat_with_user_model.dart';
import '../models/hiring_chat_model.dart';
import '../models/job_chats_model.dart';
import '../models/show_chat_info_model.dart';

class ChatRepository {
  final WebServices webServices;

  ChatRepository(this.webServices);

//fetch poducts
  Future<ApiResult<List<HiringChatModel>>> getHiringChats() async {
    try {
      var response = await webServices.getAllHiringChats('Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<List<HiringChatModel>>> getRequestsChats() async {
    try {
      var response = await webServices.getAllRequestsChats('Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<JobChatsModel>> getAllJobsChats(int chatId) async {
    try {
      var response = await webServices.getAllJobChats('Bearer $token', chatId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<ShowChatInfoModel>> getChatInfo(int chatId) async {
    try {
      var response = await webServices.getChatInfo('Bearer $token', chatId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<List<ChatMessagesModel>>> getAllChatMessages(
      int chatId) async {
    try {
      var response =
          await webServices.getAllChatMessages('Bearer $token', chatId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<UpdateSkill>> sendMessage(
      String chatId, String message, File? attachment) async {
    try {
      var response = attachment == null
          ? await webServices.sendMessage('Bearer $token', chatId, message)
          : await webServices.sendAttachmnet(
              'Bearer $token', chatId, message, attachment);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<UpdateSkill>> reportChat(
    String chatId,
    String comment,
  ) async {
    try {
      var response =
          await webServices.reportChat('Bearer $token', chatId, comment);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<ChatWithUserModel>> chatWithUser(
    String requestId,
    String targetId,
  ) async {
    try {
      var response =
          await webServices.chatWithUser('Bearer $token', requestId, targetId);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

     Future<ApiResult<UnreadMessagesCount>> getUnreadMessagesCount() async {
    try {
      var response = await webServices.getUnreadMessagesCount(
          'Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
