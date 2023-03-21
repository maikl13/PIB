



import '../models/ad_model.dart';

import '../../../../core/resources/constants.dart';
import '../../../../core/web_services/api_result.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/web_services/web_services.dart';
import '../models/slider_model.dart';

class HomeRepository {
  final WebServices webServices;

  HomeRepository(this.webServices);

Future<ApiResult<List<SliderModel>>> getAllSliders() async {
    try {
      var response = await webServices.getAllSliders(
          'Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }


Future<ApiResult<List<AdModel>>> getAllAds() async {
    try {
      var response = await webServices.getAllAds(
          'Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

// Future<ApiResult<List<DealModel>>> getInternationalTopDeals() async {
//     try {
//       var response = await webServices.getInternationalTopDeals(
//           'Bearer $token');
//       return ApiResult.success(response);
//     } catch (error) {
//       return ApiResult.failure(NetworkExceptions.getDioException(error));
//     }
//   }

//   Future<ApiResult<List<DealModel>>> getLocalTopDeals() async {
//     try {
//       var response = await webServices.getLocalTopDeals(
//           'Bearer $token');
//       return ApiResult.success(response);
//     } catch (error) {
//       return ApiResult.failure(NetworkExceptions.getDioException(error));
//     }
//   }

}
