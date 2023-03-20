

import '../../../../core/resources/constants.dart';
import '../../../../core/web_services/api_result.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/web_services/web_services.dart';
import '../models/hiring_chat_model.dart';

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
  
}
