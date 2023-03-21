import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:pip/features/menu/data/models/rates_model.dart';
import 'package:pip/features/menu/data/models/setting_model.dart';
import 'package:pip/features/menu/data/models/update_skill.dart';

import '../../../../core/resources/constants.dart';
import '../../../../core/web_services/api_result.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../../core/web_services/web_services.dart';
import '../../../pip/data/models/skills_model.dart';
import '../models/add_balance.dart';
import '../models/user_info_model.dart';
import '../models/wallet_info.dart';

class MenuRepository {
  final WebServices webServices;

  MenuRepository(this.webServices);

  Future<ApiResult<List<SkillModel>>> getAllUserSkills() async {
    try {
      var response = await webServices.getAllUserSkills('Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<RatesModel>> getAllRates() async {
    try {
      var response = await webServices.getAllRates('Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<UpdateSkill>> updateSkill(List<int> skills) async {
    try {
      var response = await webServices.updateSkill('Bearer $token', skills);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<WalletInfo>> getWalletInfo() async {
    try {
      var response = await webServices.getWalletInfo('Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<AddBalance>> addBalanceToWallet(String amount) async {
    try {
      var response =
          await webServices.addBalanceToWallet('Bearer $token', amount);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<List<SettingModel>>> getAllSettings() async {
    try {
      var response = await webServices.getAllSettings('Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<UpdateSkill>> updateProfile(
      String name, String email, String phone, File? image) async {
    try {
      var response = image == null
          ? await webServices.updateProfileWithoutImage(
              name, email, phone, 'Bearer $token')
          : await webServices.updateProfile(
              name, email, phone, image, 'Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<UpdateSkill>> sendComplain(
      String name,
      String phone,
      String email,
      String notes,
     ) async {
    try {
      var response = await webServices.sendComplain(
          'Bearer $token',
          name,
          phone,
          email,
          notes,
          );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<UpdateSkill>> sendRates(
      double experienceStars,
      double proffesionalStars,
      double communicationStars,
      double qualityStars,
      double timeStars) async {
    try {
      var response = await webServices.sendRates(
          'Bearer $token',
          experienceStars,
          proffesionalStars,
          communicationStars,
          qualityStars,
          timeStars);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<UserInfoModel>> getUserInfo() async {
    try {
      var response = await webServices.getUserInfo('Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
