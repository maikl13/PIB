
import '../../../../core/web_services/api_result.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/web_services/web_services.dart';
import '../models/auth_model.dart';

class AuthRepoistry {
  final WebServices webServices;

  AuthRepoistry(this.webServices);

//register
  Future<ApiResult<AuthModel>> registerNewUser(
    String? token,
    String? name,
    String? email,
    String? phone,
    String? imageUrl,

  ) async {
    try {
      var response = await webServices.register(token, name,
          email, phone, imageUrl);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

//Login
  Future<ApiResult<AuthModel>> login(String uid) async {
    try {
      var response = await webServices.login(uid);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }



}
