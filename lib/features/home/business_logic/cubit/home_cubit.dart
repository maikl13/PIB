import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/ad_model.dart';

import '../../../../core/web_services/network_exceptions.dart';
import '../../data/models/slider_model.dart';
import '../../data/repository/home_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepository) : super(const HomeState.idle());
  final HomeRepository homeRepository;
  List<SliderModel> sliders = [];
  int defaultChoiceIndex = 0;
  int defaultOrderCategories = 0;
  bool showTitle = true;


  void getAllSliders() async {
    emit(const HomeState.homeSlidersLoading());
    var result = await homeRepository.getAllSliders();
    result.when(
      success: (List<SliderModel> sliders) {
        sliders = sliders;
        emit(HomeState.homeSlidersSuccess(sliders));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(HomeState.homeSlidersError(networkExceptions));
      },
    );
  }
  void getAllAds() async {
    emit(const HomeState.homeAdsLoading());
    var result = await homeRepository.getAllAds();
    result.when(
      success: (List<AdModel> ads) {
        
        emit(HomeState.homeAdsSuccess(ads));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(HomeState.homeSlidersError(networkExceptions));
      },
    );
  }

  

}
