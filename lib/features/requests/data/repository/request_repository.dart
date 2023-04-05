import 'dart:io';

import 'package:pip/features/pip/data/models/driver_model.dart';
import 'package:pip/features/requests/data/models/accepted_offers_model.dart';

import '../models/available_fast_request_model.dart';
import '../models/create_fast_request_model.dart';
import '../models/fast_request_model.dart';
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

  Future<ApiResult<List<FastRequestModel>>> getAllMyFastRequests() async {
    try {
      var response = await webServices.getFastRequests('Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      // print(error.toString() + 'asdmfasm,fnasm,fns');
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<List<AvailableFastRequestModel>>>
      getAllAvailableFastRequests() async {
    try {
      var response =
          await webServices.getAvailableFastRequests('Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      print(error.toString() + 'asdmfasm,fnasm,fns');
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

  Future<ApiResult<List<OfferModel>>> getAllRequestOffers(int id) async {
    try {
      var response = await webServices.getAllRequestOffers('Bearer $token', id);
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

  Future<ApiResult<UpdateSkill>> updateRequest(
    String id,
    String categoryId,
    String price,
    String location,
    String description,
  ) async {
    try {
      var response = await webServices.updateRequest(
          'Bearer $token', id, categoryId, price, location, description);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<UpdateSkill>> deleteRequest(
    String id,
  ) async {
    try {
      var response = await webServices.deleteRequest('Bearer $token', id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<UpdateSkill>> completeRequest(
    String id,
  ) async {
    try {
      var response = await webServices.completeRequest('Bearer $token', id);
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

  Future<ApiResult<UpdateSkill>> rejectFastRequest(String requestId) async {
    try {
      var response =
          await webServices.rejectFastRequest('Bearer $token', requestId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<UpdateSkill>> acceptFastRequest(String requestId) async {
    try {
      var response =
      await webServices.acceptFastRequest('Bearer $token', requestId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }




  Future<ApiResult<UpdateSkill>> cancelFastRequest(String requestId) async {
    try {
      var response =
          await webServices.cancelFastRequest('Bearer $token', requestId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<UpdateSkill>> completeFastRequest(
      String requestId, String price) async {
    try {
      var response = await webServices.completeFastRequest(
          'Bearer $token', requestId, price);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<CreateFastRequestModel>> createFastRequest(
    String? categoryId,
    String? mettingPointLat,
    String? mettingPointLong,
    String? destinationLat,
    String? destinationLong,
    String? description,
  ) async {
    try {
      var response = await webServices.createFastRequest(
          'Bearer $token',
          categoryId,
          mettingPointLat,
          mettingPointLong,
          destinationLat,
          destinationLong,description,);
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

  Future<ApiResult<List<AcceptedOffersModel>>> getAllAcceptedOfferForDriver(
  
  ) async {
    try {
      var response = await webServices.getAllAcceptedOfferForDriver(
          'Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
