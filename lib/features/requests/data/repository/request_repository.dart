import 'dart:io';

import '../models/offer_model.dart';

import '../../../../core/resources/constants.dart';
import '../../../../core/web_services/api_result.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/web_services/web_services.dart';
import '../../../menu/data/models/update_skill.dart';
import '../models/my_request_model.dart';

class RequestRepository {
  final WebServices webServices;

  RequestRepository(this.webServices);

//fetch poducts
  Future<ApiResult<List<MyRequestModel>>> getAllMyRequests() async {
    try {
      var response = await webServices.getAllMyRequests('Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<List<MyRequestModel>>> getAllAvailableJobs() async {
    try {
      var response = await webServices.getAllAvailableJobs('Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<List<OfferModel>>> getAllOffers() async {
    try {
      var response = await webServices.getAllOffers('Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<UpdateSkill>> giveOffer(
    String price,
    String duration,
    String description,
    List<File> images,
    String requestId,
  ) async {
    try {
      var response = await webServices.giveOffer(
          'Bearer $token', price, duration, description, images, requestId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<UpdateSkill>> acceptOffer(String offerId) async {
    try {
      var response = await webServices.acceptOffer('Bearer $token', offerId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<UpdateSkill>> giveOfferWithoutImages(
    String price,
    String duration,
    String description,
    String requestId,
  ) async {
    try {
      var response = await webServices.giveOfferWithoutImages(
          'Bearer $token', price, duration, description, requestId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
