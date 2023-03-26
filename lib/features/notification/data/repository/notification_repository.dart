

import '../../../../core/resources/constants.dart';
import '../../../../core/web_services/api_result.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/web_services/web_services.dart';
import '../models/notification_model.dart';
import '../models/unread_notification.dart';

class NotificationRepository {
  final WebServices webServices;

  NotificationRepository(this.webServices);

//fetch poducts
  Future<ApiResult<List<NotifiticationModel>>> getAllNotifications() async {
    try {
      var response = await webServices.getAllNotifications(
          'Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

    Future<ApiResult<UnreadNotificationCount>> getUnreadNotificationCount() async {
    try {
      var response = await webServices.getUnreadNotificationCount(
          'Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
