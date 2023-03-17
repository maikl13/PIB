

import 'package:pip/features/pip/data/models/skills_model.dart';

import '../../../../core/resources/constants.dart';
import '../../../../core/web_services/api_result.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/web_services/web_services.dart';

class PipRepsitory{
  final WebServices webServices;

  PipRepsitory(this.webServices);

//fetch poducts
  Future<ApiResult<List<SkillModel>>> getAllSkills() async {
    try {
      var response = await webServices.getAllSkills(
          'Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
