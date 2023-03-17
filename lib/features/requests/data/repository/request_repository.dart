


import '../../../../core/resources/constants.dart';
import '../../../../core/web_services/api_result.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/web_services/web_services.dart';
import '../models/my_request_model.dart';

class RequestRepository{
  final WebServices webServices;

  RequestRepository(this.webServices);

//fetch poducts
  Future<ApiResult<List<MyRequestModel>>> getAllMyRequests() async {
    try {
      var response = await webServices.getAllMyRequests(
          'Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }


    Future<ApiResult<List<MyRequestModel>>> getAllAvailableJobs() async {
    try {
      var response = await webServices.getAllAvailableJobs(
          'Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
