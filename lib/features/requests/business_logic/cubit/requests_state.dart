import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/offer_model.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../menu/data/models/update_skill.dart';
import '../../data/models/my_request_model.dart';
part 'requests_state.freezed.dart';

@freezed
class RequestState<T> with _$RequestState<T> {
  const factory RequestState.idle() = Idle<T>;

  const factory RequestState.myRequestsLoading() = MyRequestsLoading<T>;

  const factory RequestState.myRequestsSuccess(
      List<MyRequestModel> myRequests) = MyRequestsSuccess<T>;

  const factory RequestState.myRequestsError(
      NetworkExceptions networkExceptions) = MyRequestsError<T>;

  const factory RequestState.offersLoading() = OffersLoading<T>;

  const factory RequestState.offersSuccess(List<OfferModel> offers) =
      OffersSuccess<T>;

  const factory RequestState.offersError(NetworkExceptions networkExceptions) =
      OffersError<T>;


  const factory RequestState.offersRequestLoading() = OffersRequestLoading<T>;

  const factory RequestState.offersRequestSuccess(List<OfferModel> offers) =
      OffersRequestSuccess<T>;

  const factory RequestState.offersRequestError(NetworkExceptions networkExceptions) =
      OffersRequestError<T>;



  const factory RequestState.myAvailableJobsLoading() =
      MyAvailableJobsLoading<T>;

  const factory RequestState.myAvailableJobsSuccess(
      List<MyRequestModel> myRequests) = MyAvailableJobsSuccess<T>;

  const factory RequestState.myAvailableJobsError(
      NetworkExceptions networkExceptions) = MyAvailableJobsError<T>;

  const factory RequestState.imageSelectedSuccess(List<File> images) =
      ImageSelectedSuccess<T>;

  const factory RequestState.imageSelectedLoading() = ImageSelectedLoading<T>;
  const factory RequestState.imageSelectedError() = ImageSelectedError<T>;
  const factory RequestState.imageSelectedDeleted(List<File> images) =
      ImageSelectedDeleted<T>;

  const factory RequestState.createSpecialRequestLoading() =
      CreateSpecialRequestLoading<T>;

  const factory RequestState.createSpecialRequestSuccess(UpdateSkill data) =
      CreateSpecialRequestSuccess<T>;

  const factory RequestState.createSpecialRequestError(
      NetworkExceptions networkExceptions) = CreateSpecialRequestError<T>;


      const factory RequestState.giveOfferLoading() = GiveOfferLoading<T>;

  const factory RequestState.giveOfferSuccess(UpdateSkill data) = GiveOfferSuccess<T>;

  const factory RequestState.giveOfferError(NetworkExceptions networkExceptions) =
     GiveOfferError<T>;



           const factory RequestState.acceptOfferLoading() = AcceptOfferLoading<T>;

  const factory RequestState.acceptOfferSuccess(UpdateSkill data) = AcceptOfferSuccess<T>;

  const factory RequestState.acceptOfferError(NetworkExceptions networkExceptions) =
     AcceptOfferError<T>;
}
