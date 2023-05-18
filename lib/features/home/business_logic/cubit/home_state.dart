import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/ad_model.dart';

import '../../../../core/web_services/network_exceptions.dart';
import '../../data/models/slider_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState<T> with _$HomeState<T> {
  const factory HomeState.idle() = Idle<T>;
  const factory HomeState.loading() = Loading<T>;
  const factory HomeState.error() = Error<T>;
    const factory HomeState.homeSlidersLoading() = HomeSlidersLoading<T>;
  const factory HomeState.homeSlidersSuccess(List<SliderModel> sliders) = HomeSlidersSuccess<T>;
  const factory HomeState.homeSlidersError(NetworkExceptions networkExceptions) = HomeSlidersError<T>;


  const factory HomeState.homeAdsLoading() = HomeAdsLoading<T>;
  const factory HomeState.homeAdsSuccess(List<AdModel> ads) = HomeAdsSuccess<T>;
  const factory HomeState.homeAdsError(NetworkExceptions networkExceptions) = HomeAdsError<T>;

    const factory HomeState.selectedIndexChanged(int index) = SelectedIndexChanged<T>;

}
