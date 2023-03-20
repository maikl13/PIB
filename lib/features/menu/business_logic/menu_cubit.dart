import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pip/features/menu/data/models/rates_model.dart';
import 'package:pip/features/menu/data/models/update_skill.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../core/resources/color_manager.dart';
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
//  WalletInfo walletInfo ;

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
        // notifications = notifications;
        ratesFromOneToFive.add(rates.fiveStarsTotal.toString());
        ratesFromOneToFive.add(rates.fourStarsTotal.toString());
        ratesFromOneToFive.add(rates.threeStarsTotal.toString());
        ratesFromOneToFive.add(rates.twoStarsTotal.toString());
        ratesFromOneToFive.add(rates.oneStarTotal.toString());

        emit(MenuState.getRatesSuccess(rates));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(MenuState.getRatesError(networkExceptions));
      },
    );
  }


  void updateSkill() async {
    emit(const MenuState.updateSkillLoading());
    // ignore: prefer_typing_uninitialized_variables
    var result = await menuRepository.updateSkill(skills);
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
                  "Please Add Amount",
                  style: getBoldStyle(
                      color: ColorManager.primary, fontSize: 18.sp),
                ),
              ),
              content: Form(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DefaultTextField(
                    controller: _amountController,
                    suffix: Text(
                      "",
                      style: getRegularStyle(
                          color: ColorManager.primary, fontSize: 14.sp),
                    ),
                    hint: "Enter Amount",
                  ),
                  SizedBox(height: 15.h),
                  DefaultButton(
                    text: 'Confirm',
                    onTap: onTap,
                  ),
                ],
              )),
            ));
  }
}
