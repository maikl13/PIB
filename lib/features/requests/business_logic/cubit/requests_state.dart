import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../pip/data/models/driver_model.dart';
import '../../data/models/accepted_offers_model.dart';
import '../../data/models/available_fast_request_model.dart';
import '../../data/models/create_fast_request_model.dart';
import '../../data/models/fast_request_model.dart';
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




 const factory RequestState.myAcceptedFastOffersLoading() = MyAcceptedFastOffersLoading<T>;

  const factory RequestState.myAcceptedFastOffersSuccess(
      List<AcceptedOffersModel> myAcceptedFastOffers) = MyAcceptedFastOffersSuccess<T>;

  const factory RequestState.myAcceptedFastOffersError(
      NetworkExceptions networkExceptions) = MyAcceptedFastOffersError<T>;


       const factory RequestState.showSingleOfferLoading() = ShowSingleOfferLoading<T>;

  const factory RequestState.showSingleOfferSuccess(
      OfferModel offer) = ShowSingleOfferSuccess<T>;

  const factory RequestState.showSingleOfferError(
      NetworkExceptions networkExceptions) = ShowSingleOfferError<T>;



        const factory RequestState.myFastRequestsLoading() = MyFastRequestsLoading<T>;

  const factory RequestState.myFastRequestsSuccess(
      List<FastRequestModel> myFastRequests) = MyFastRequestsSuccess<T>;

  const factory RequestState.myFastRequestsError(
      NetworkExceptions networkExceptions) = MyFastRequestsError<T>;
        const factory RequestState.myAvailableFastRequestsLoading() = MyAvailableFastRequestsLoading<T>;

  const factory RequestState.myAvailableFastRequestsSuccess(
      List<AvailableFastRequestModel> myAvailableFastRequests) = MyAvailableFastRequestsSuccess<T>;

  const factory RequestState.myAvailableFastRequestsError(
      NetworkExceptions networkExceptions) = MyAvailableFastRequestsError<T>;

      

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




        const factory RequestState.updateRequestLoading() =
      UpdateRequestLoading<T>;

  const factory RequestState.updateRequestSuccess(UpdateSkill data) =
      UpdateRequestSuccess<T>;

  const factory RequestState.updateRequestError(
      NetworkExceptions networkExceptions) = UpdateRequestError<T>;

    const factory RequestState.deleteRequestTapped() =
      DeleteRequestTapped<T>;

              const factory RequestState.deleteRequestLoading() =
      DeleteRequestLoading<T>;

  const factory RequestState.deleteRequestSuccess(UpdateSkill data) =
      DeleteRequestSuccess<T>;

  const factory RequestState.deleteRequestError(
      NetworkExceptions networkExceptions) = DeleteRequestError<T>;




   const factory RequestState.completeRequestLoading() =
      CompleteRequestLoading<T>;

  const factory RequestState.completeRequestSuccess(UpdateSkill data) =
      CompleteRequestSuccess<T>;

  const factory RequestState.completeRequestError(
      NetworkExceptions networkExceptions) = CompleteRequestError<T>;




      const factory RequestState.giveOfferLoading() = GiveOfferLoading<T>;

  const factory RequestState.giveOfferSuccess(UpdateSkill data) = GiveOfferSuccess<T>;

  const factory RequestState.giveOfferError(NetworkExceptions networkExceptions) =
     GiveOfferError<T>;

//TODO add states for updating offers 

           const factory RequestState.acceptOfferLoading() = AcceptOfferLoading<T>;

  const factory RequestState.acceptOfferSuccess(UpdateSkill data) = AcceptOfferSuccess<T>;


  const factory RequestState.acceptOfferError(NetworkExceptions networkExceptions) =
     AcceptOfferError<T>;

     const factory RequestState.acceptFastRequestLoading() =  AcceptFastRequestLoading<T>;
  const factory RequestState.rejectFastRequestSuccess(UpdateSkill data) =   RejectFastRequestSuccess<T>;

  const factory RequestState.acceptFastRequestSuccess(UpdateSkill data) =   AcceptFastRequestSuccess<T>;





  const factory RequestState.acceptFastRequestError(NetworkExceptions networkExceptions) =
     AcceptFastRequestError<T>;




     const factory RequestState.cancelFastRequestLoading() =  CancelFastRequestLoading<T>;

  const factory RequestState.cancelFastRequestSuccess(UpdateSkill data) =   CancelFastRequestSuccess<T>;

  const factory RequestState.cancelFastRequestError(NetworkExceptions networkExceptions) =
     CancelFastRequestError<T>;


        const factory RequestState.completeFastRequestLoading() =  CompleteFastRequestLoading<T>;

  const factory RequestState.completeFastRequestSuccess(UpdateSkill data) =   CompleteFastRequestSuccess<T>;

  const factory RequestState.completeFastRequestError(NetworkExceptions networkExceptions) =
     CompleteFastRequestError<T>;


        const factory RequestState.createFastRequestLoading() =  CreateFastRequestLoading<T>;

  const factory RequestState.createFastRequestSuccess(CreateFastRequestModel data) =   CreateFastRequestSuccess<T>;

  const factory RequestState.createFastRequestError(NetworkExceptions networkExceptions) =
     CreateFastRequestError<T>;
}
