import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pip/core/resources/strings_manager.dart';
import '../data/models/rates_model.dart';
import '../data/models/setting_model.dart';
import '../data/models/update_skill.dart';
import '../data/models/user_info_model.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/commons.dart';
import '../../../core/resources/constants.dart';
import '../../../core/resources/route_manager.dart';
import '../../../core/resources/shared_prefrences.dart';
import '../../../core/resources/style_manager.dart';
import '../../../core/widgets/default_button.dart';
import '../../../core/widgets/default_textfield.dart';
import '../../pip/data/models/skills_model.dart';
import '../data/models/add_balance.dart';
import '../data/models/wallet_info.dart';
import '../data/repository/menu_repository.dart';
import 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit(this.menuRepository) : super(const MenuState.idle());

  final MenuRepository menuRepository;
  final TextEditingController _amountController = TextEditingController();
  List<int> skills = [];
  List<String> ratesFromOneToFive = [];
  RatesModel ratesModel = RatesModel();

  double experienceRate = 0.0;
  double professionlRate = 0.0;
  double communicationRate = 0.0;
  double qualityRate = 0.0;
  double timeRate = 0.0;
  double initialRating = 0.0;

  File? imageFile;
  String? image;
  Future pickImage() async {
    try {
      emit(const MenuState.imageSelectedLoading());
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporry = File(image.path);

      imageFile = imageTemporry;
      this.image = image.path;
      emit(const MenuState.imageSelectedSuccess());
    } on PlatformException catch (e) {
      emit(const MenuState.imageSelectedError());
      Commons.showToast(message: e.toString());
      // print('Failed to pick image $e ');
    }
  }

  void sendRate() {}

  void updateExperienceRate(double rate) {
    experienceRate = rate;
    emit(const MenuState.updateExperienceRateSuccess());
  }

  void updateProfessionlRate(double rate) {
    professionlRate = rate;
    emit(const MenuState.updateProfessionlRateSuccess());
  }

  void updateCommunicationRate(double rate) {
    communicationRate = rate;
    emit(const MenuState.updateCommunicationRateSuccess());
  }

  void updateQualityRate(double rate) {
    qualityRate = rate;
    emit(const MenuState.updateQualityRate());
  }

  void updateTimeRate(double rate) {
    timeRate = rate;
    emit(const MenuState.updateTimeRateSuccess());
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Commons.showToast(
          message: "User signed out successfully.", color: ColorManager.green);
      CacheHelper.removeData(key: 'uid');
      CacheHelper.removeData(key: 'token');
      CacheHelper.removeData(key: 'userImage');
      CacheHelper.removeData(key: 'userName');
      CacheHelper.removeData(key: 'userPhone');
      CacheHelper.removeData(key: 'goToHome');
      CacheHelper.removeData(key: 'userEmail');
      CacheHelper.removeData(key: 'countryCode');
      // CacheHelper.removeData(key: 'userType');
      // CacheHelper.removeAll();

      screenIndex = 0;

      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, Routes.onBoardingViewRoute);

      // emit(const AuthResultState.firebaseSignOutSuccess());
    } catch (e) {
      Commons.showToast(
        message: e.toString(),
      );
    }
  }

  void updateProfile(String name, String email, String phone) async {
    emit(const MenuState.updateUserInfoLoading());
    var result =
        await menuRepository.updateProfile(name, email, phone, imageFile);
    result.when(
      success: (UpdateSkill data) {
        imageFile = null;
        // userImage = userInfoModel.userInfo!.img!;
        emit(MenuState.updateUserInfoSuccess(data));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(MenuState.updateUserInfoError(networkExceptions));
      },
    );
  }

  void sendComplain(String phone, String notes) async {
    emit(const MenuState.sendComplainLoading());
    var result = await menuRepository.sendComplain(
        userName ?? '', phone, userEmail ?? '', notes);
    result.when(
      success: (UpdateSkill data) {
        emit(MenuState.sendComplainSuccess(data));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(MenuState.sendComplainError(networkExceptions));
      },
    );
  }

  void getUserInfo() async {
    emit(const MenuState.getUserInfoLoading());
    var result = await menuRepository.getUserInfo();
    result.when(
      success: (UserInfoModel userInfo) {
        emit(MenuState.getUserInfoSuccess(userInfo));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(MenuState.getUserInfoError(networkExceptions));
      },
    );
  }

  void updateRate() async {
    emit(const MenuState.updateRateLoading());
    var result = await menuRepository.sendRates(experienceRate, professionlRate,
        communicationRate, qualityRate, timeRate);
    result.when(
      success: (UpdateSkill data) {
        emit(MenuState.updateRateSuccess(data));
        ratesFromOneToFive.clear();
        experienceRate = 0.0;
        professionlRate = 0.0;
        communicationRate = 0.0;
        qualityRate = 0.0;
        timeRate = 0.0;
        initialRating = 0.0;
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(MenuState.updateRateError(networkExceptions));
      },
    );
  }

  void getWalletInfo() async {
    emit(const MenuState.walletInfoLoading());
    // ignore: prefer_typing_uninitialized_variables
    var result = await menuRepository.getWalletInfo();
    result.when(
      success: (WalletInfo walletInfo) {
        // notifications = notifications;
        emit(MenuState.walletInfoSuccedded(walletInfo));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(MenuState.walletInfoError(networkExceptions));
      },
    );
  }

  void getAllRates() async {
    emit(const MenuState.getRatesLoading());
    // ignore: prefer_typing_uninitialized_variables
    var result = await menuRepository.getAllRates();
    result.when(
      success: (RatesModel rates) {
        emit(MenuState.getRatesSuccess(rates));
        ratesModel = rates;

        // notifications = notifications;
        ratesFromOneToFive.add(rates.fiveStarsTotal.toString());
        ratesFromOneToFive.add(rates.fourStarsTotal.toString());
        ratesFromOneToFive.add(rates.threeStarsTotal.toString());
        ratesFromOneToFive.add(rates.twoStarsTotal.toString());
        ratesFromOneToFive.add(rates.oneStarTotal.toString());
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(MenuState.getRatesError(networkExceptions));
      },
    );
  }

  void getAllSettings() async {
    emit(const MenuState.getSettingLoading());
    // ignore: prefer_typing_uninitialized_variables
    var result = await menuRepository.getAllSettings();
    result.when(
      success: (List<SettingModel> settings) {
        // notifications = notifications;

        emit(MenuState.getSettingSuccess(settings));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(MenuState.getSettingError(networkExceptions));
      },
    );
  }

  void updateSkill() async {
    emit(const MenuState.updateSkillLoading());
    // ignore: prefer_typing_uninitialized_variables
    var result = await menuRepository.updateSkill(skills.join(','));
    result.when(
      success: (UpdateSkill data) {
        // notifications = notifications;
        emit(MenuState.updateSkillSuccess(data));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(MenuState.updateSkillError(networkExceptions));
      },
    );
  }

  void addAmountToWallet() async {
    emit(const MenuState.walletBlanceAddedLoading());
    // ignore: prefer_typing_uninitialized_variables
    var result =
        await menuRepository.addBalanceToWallet(_amountController.text);
    result.when(
      success: (AddBalance addBalance) {
        // notifications = notifications;
        emit(MenuState.walletBalanceAddedSuccedded(addBalance));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(MenuState.walletBalanceAdddedError(networkExceptions));
      },
    );
  }

  void getAllUserSkills() async {
    emit(const MenuState.userSkillsLoading());

    // ignore: prefer_typing_uninitialized_variables
    var result = await menuRepository.getAllUserSkills();
    result.when(
      success: (List<SkillModel> skills) {
        for (var element in skills) {
          if (element.enabled == 1) {
            this.skills.add(element.id!);
          }
        }
        emit(MenuState.userSkillsSuccess(skills));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(MenuState.userSkillsError(networkExceptions));
      },
    );
  }

  Future<void> showWalletAddAmountDialog(BuildContext context, Key formKey,
      {required void Function()? onTap}) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
              ),
              title: Center(
                child: Text(
                  "من فضلك ادخل المبلغ",
                  style: getBoldStyle(
                      color: ColorManager.primary, fontSize: 18.sp),
                ),
              ),
              content: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DefaultTextField(
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return "من فضلك ادخل المبلغ";
                          }
                          return null;
                        },
                        controller: _amountController,
                        suffix: Text(
                          "",
                          style: getRegularStyle(
                              color: ColorManager.primary, fontSize: 14.sp),
                        ),
                        hint: "ادخل المبلغ",
                      ),
                      SizedBox(height: 15.h),
                      DefaultButton(
                        text: AppStrings.confirm,
                        onTap: onTap,
                      ),
                    ],
                  )),
            ));
  }
}
