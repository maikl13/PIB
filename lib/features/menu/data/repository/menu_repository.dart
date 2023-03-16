


import '../../../../core/resources/constants.dart';
import '../../../../core/web_services/api_result.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/web_services/web_services.dart';
import '../models/add_balance.dart';
import '../models/wallet_info.dart';

class MenuRepository {
  final WebServices webServices;

  MenuRepository(this.webServices);

//fetch poducts
  Future<ApiResult<WalletInfo>> getWalletInfo() async {
    try {
      var response = await webServices.getWalletInfo(
          'Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

   Future<ApiResult<AddBalance>> addBalanceToWallet(String amount) async {
    try {
      var response = await webServices.addBalanceToWallet(
          'Bearer $token',amount);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
