


import 'package:pip/features/home/data/models/ad_model.dart';

import '../../../../core/resources/constants.dart';
import '../../../../core/web_services/api_result.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/web_services/web_services.dart';

class SearchRepository {
  final WebServices webServices;

  SearchRepository(this.webServices);

//fetch poducts
  Future<ApiResult<List<Ads>>> getSearchResults(String keyword )async {
    try {
      var response = await webServices.getSearchResults(
          'Bearer $token',keyword);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

 
}
