import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/constants.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.idle());

  int defaultChoiceIndex = 0;
  int defaultOrderCategories = 0;
  bool showTitle = true;

  changeSelectedIndex(int index) {
    screenIndex = index;
    selectedTab = index;
    emit(HomeState.selectedIndexChanged(index));
  }

  void goToBuyerHome() {
    // emit(const HomeState.successBuyerHome());
  }

  void goToSellerHome() {
    // emit(const HomeState.successSellerHome());
  }

  void showSelectedView() {
    if (defaultChoiceIndex == 0) {
      goToSellerHome();
    }

    if (defaultChoiceIndex == 1) {
      showTitle = false;
      goToBuyerHome();
    }
  }
}
