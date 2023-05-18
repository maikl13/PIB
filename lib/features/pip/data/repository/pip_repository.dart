import 'dart:io';

import '../../../menu/data/models/update_skill.dart';
import '../models/fast_request_category.dart';
import '../models/skills_model.dart';

import '../../../../core/resources/constants.dart';
import '../../../../core/web_services/api_result.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/web_services/web_services.dart';
import '../models/toggle_model.dart';

class PipRepsitory {
  final WebServices webServices;

  PipRepsitory(this.webServices);

//fetch poducts
  Future<ApiResult<List<SkillModel>>> getAllSkills() async {
    try {
      var response = await webServices.getAllSkills('Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }


    Future<ApiResult<List<FastRequestCategory>>> getAllFastRequestCategories() async {
    try {
      var response = await webServices.getAllFastRequestCategories('Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<UpdateSkill>> createSpecialRequest(
      String categoryId,
      String price,
      String location,
      String description,
      List<File> images) async {
    try {
      var response = await webServices.createSpecialRequest(
          'Bearer $token', categoryId, price, location, description, images);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<UpdateSkill>> createSpecialWithoutImageRequest(
      String categoryId,
      String price,
      String location,
      String description) async {
    try {
      var response = await webServices.createSpecialRequestWithoutImage(
          'Bearer $token', categoryId, price, location, description);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<ToggleModel>> toggleFastRequest() async {
    try {
      var response = await webServices.toggleFastRequest('Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
