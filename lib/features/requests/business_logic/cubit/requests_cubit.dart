import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../../../pip/data/models/driver_model.dart';
import '../../data/models/accepted_offers_model.dart';
import '../../data/models/fast_request_model.dart';

import '../../../../core/resources/constants.dart';
import '../../data/models/available_fast_request_model.dart';
import '../../data/models/create_fast_request_model.dart';
import 'requests_state.dart';
import '../../data/models/my_request_model.dart';
import '../../data/models/offer_model.dart';

import '../../../../core/resources/commons.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../../menu/data/models/update_skill.dart';
import '../../data/repository/request_repository.dart';

class RequestsCubit extends Cubit<RequestState> {
  RequestsCubit(this.requestRepository) : super(const RequestState.idle());

  final RequestRepository requestRepository;

  List<File> imagesFile = [];
  List<MyRequestModel> myRequests = [];
  List<MyRequestModel> myAvailableJobs = [];

  List<FastRequestModel> myFastRequests = [];

  List<AvailableFastRequestModel> myAvailableFastRequests = [];

  List<AcceptedOffersModel> myAcceptedFastOffers = [];
  List<AcceptedOffersModel> completedOffers= [];


  deleteImage(int index) {
    imagesFile.removeAt(index);
  }

  void onReorder(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final item = imagesFile.removeAt(oldIndex);
    imagesFile.insert(newIndex, item);

    emit(RequestState.imageSelectedDeleted(imagesFile));
  }

  Future pickImage() async {
    emit(const RequestState.imageSelectedLoading());

    try {
      final List<XFile> images = await ImagePicker().pickMultiImage();

      final imagesList = images.map((e) => File(e.path)).toList();
      imagesFile.addAll(imagesList);

      emit(RequestState.imageSelectedSuccess(imagesFile));
    } on PlatformException catch (e) {
      emit(const RequestState.imageSelectedError());
      Commons.showToast(message: e.toString());
      // print('Failed to pick image $e ');
    }
  }

  void getAllMyRequests() async {
    emit(const RequestState.myRequestsLoading());

    // ignore: prefer_typing_uninitialized_variables
    var result = await requestRepository.getAllMyRequests();
    result.when(
      success: (List<MyRequestModel> requests) {
        myRequests = requests;
        emit(RequestState.myRequestsSuccess(requests));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(RequestState.myRequestsError(networkExceptions));
      },
    );
  }

  void getAllMyFastRequests() async {
    emit(const RequestState.myFastRequestsLoading());

    // ignore: prefer_typing_uninitialized_variables
    var result = await requestRepository.getAllMyFastRequests();
    result.when(
      success: (List<FastRequestModel> fastRequests) {
        // print('fastRequests $fastRequests');
        myFastRequests = fastRequests;
        emit(RequestState.myFastRequestsSuccess(fastRequests));
      },
      failure: (NetworkExceptions networkExceptions) {
        // print('networkExceptions $networkExceptions');
        emit(RequestState.myFastRequestsError(networkExceptions));
      },
    );
  }

  void getAllMyAvailableFastRequests() async {
    emit(const RequestState.myAvailableFastRequestsLoading());

    // ignore: prefer_typing_uninitialized_variables
    var result = await requestRepository.getAllAvailableFastRequests();
    result.when(
      success: (List<AvailableFastRequestModel> availabelFastRequests) {
        // print('fastRequests $fastRequests');
        //  = fastRequests;
        myAvailableFastRequests = availabelFastRequests;
        emit(
            RequestState.myAvailableFastRequestsSuccess(availabelFastRequests));

        // emit(RequestState.myFastRequestsSuccess(fastRequests));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(RequestState.myAvailableFastRequestsError(networkExceptions));
      },
    );
  }

  void getAllAvailableJobs() async {
    emit(const RequestState.myAvailableJobsLoading());

    // ignore: prefer_typing_uninitialized_variables
    var result = await requestRepository.getAllAvailableJobs();
    result.when(
      success: (List<MyRequestModel> availableJobs) {
        myAvailableJobs = availableJobs;
        emit(RequestState.myAvailableJobsSuccess(availableJobs));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(RequestState.myAvailableJobsError(networkExceptions));
      },
    );
  }

  void getAllOffers() async {
    emit(const RequestState.offersLoading());

    var result = await requestRepository.getAllOffers();
    result.when(
      success: (List<OfferModel> offers) {
        emit(RequestState.offersSuccess(offers));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(RequestState.offersError(networkExceptions));
      },
    );
  }

    void showSingleOffer(String offerId) async {
    emit(const RequestState.showSingleOfferLoading());

    var result = await requestRepository.showSingleOffer(offerId);
    result.when(
      success: (OfferModel offer) {
        emit(RequestState.showSingleOfferSuccess(offer));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(RequestState.showSingleOfferError(networkExceptions));
      },
    );
  }
  void getAllAcceptedOfferForDriver() async {
    emit(const RequestState.myAcceptedFastOffersLoading());

    var result = await requestRepository.getAllAcceptedOfferForDriver();
    result.when(
      success: (List<AcceptedOffersModel> acceptedFastOffers) {
        myAcceptedFastOffers = acceptedFastOffers.where((element) => element.status == 'processing').toList();
        completedOffers = acceptedFastOffers.where((element) => element.status != 'processing').toList();
        
        emit(RequestState.myAcceptedFastOffersSuccess(acceptedFastOffers));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(RequestState.myAvailableFastRequestsError(networkExceptions));
      },
    );
  }


  void getAllRequestOffers(int id) async {
    emit(const RequestState.offersRequestLoading());

    var result = await requestRepository.getAllRequestOffers(id);
    result.when(
      success: (List<OfferModel> offers) {
        emit(RequestState.offersRequestSuccess(offers));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(RequestState.offersRequestError(networkExceptions));
      },
    );
  }

  void giveOffer({
    String? price,
    String? duration,
    String? description,
    File? image,
    String? requestId,
  }) async {
    emit(const RequestState.giveOfferLoading());

    // ignore: prefer_typing_uninitialized_variables
    var result = imagesFile.isEmpty
        ? await requestRepository.giveOfferWithoutImages(
        price!, duration!, description!, requestId!)
        : await requestRepository.giveOffer(
        price!, duration!, description!, imagesFile, requestId!);

    result.when(
      success: (UpdateSkill data) {
        emit(RequestState.giveOfferSuccess(data));
        // print(data.toString());
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(RequestState.giveOfferError(networkExceptions));
      },
    );
  }

  void updateRequest({
    String? id,
    String? categoryId,
    String? price,
    String? location,
    String? description,
  }) async {
    emit(const RequestState.updateRequestLoading());

    // ignore: prefer_typing_uninitialized_variables
    var result = await requestRepository.updateRequest(
        id!, categoryId!, price!, location!, description!);

    result.when(
      success: (UpdateSkill data) {
        emit(RequestState.updateRequestSuccess(data));
        // print(data.toString());
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(RequestState.updateRequestError(networkExceptions));
      },
    );
  }

  void deleteRequestTapped() {
    emit(const RequestState.deleteRequestTapped());
  }

  void deleteRequest({
    required String? id,
  }) async {
    emit(const RequestState.deleteRequestLoading());

    // ignore: prefer_typing_uninitialized_variables
    var result = await requestRepository.deleteRequest(id!);

    result.when(
      success: (UpdateSkill data) {
        emit(RequestState.deleteRequestSuccess(data));
        // print(data.toString());
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(RequestState.deleteRequestError(networkExceptions));
      },
    );
  }

  void completeRequest({
    required String? id,
  }) async {
    emit(const RequestState.completeRequestLoading());

    // ignore: prefer_typing_uninitialized_variables
    var result = await requestRepository.completeRequest(id!);

    result.when(
      success: (UpdateSkill data) {
        emit(RequestState.completeRequestSuccess(data));
        // print(data.toString());
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(RequestState.completeRequestError(networkExceptions));
      },
    );
  }

  void acceptOffer({
    required String offerId,
  }) async {
    emit(const RequestState.acceptOfferLoading());

    var result = await requestRepository.acceptOffer(offerId);

    result.when(
      success: (UpdateSkill data) {
        emit(RequestState.acceptOfferSuccess(data));
        // print(data.toString());
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(RequestState.acceptOfferError(networkExceptions));
      },
    );
  }
  void rejectFastRequest({
    required String requestId,
  }) async {
    emit(const RequestState.acceptFastRequestLoading());

    var result = await requestRepository.rejectFastRequest(requestId);

    result.when(
      success: (UpdateSkill data) {
        emit(RequestState.rejectFastRequestSuccess(data));
        // print(data.toString());
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(RequestState.acceptFastRequestError(networkExceptions));
      },
    );
  }
  void acceptFastRequest({
    required String requestId,
  }) async {
    emit(const RequestState.acceptFastRequestLoading());

    var result = await requestRepository.acceptFastRequest(requestId);

    result.when(
      success: (UpdateSkill data) {
        emit(RequestState.acceptFastRequestSuccess(data));
        // print(data.toString());
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(RequestState.acceptFastRequestError(networkExceptions));
      },
    );
  }

  void cancelFastRequest({
    required String requestId,
  }) async {
    emit(const RequestState.cancelFastRequestLoading());

    var result = await requestRepository.cancelFastRequest(requestId);

    result.when(
      success: (UpdateSkill data) {
        emit(RequestState.cancelFastRequestSuccess(data));
        // print(data.toString());
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(RequestState.cancelFastRequestError(networkExceptions));
      },
    );
  }

  void completeFastRequest({
    required String requestId,
    required String price,
  }) async {
    emit(const RequestState.completeFastRequestLoading());

    var result = await requestRepository.completeFastRequest(requestId, price);

    result.when(
      success: (UpdateSkill data) {
        emit(RequestState.completeFastRequestSuccess(data));
        // print(data.toString());
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(RequestState.completeFastRequestError(networkExceptions));
      },
    );
  }

  void createFastRequest({
    required String? mettingPointLat,
    required String? mettingPointLong,
    required String? destinationLat,
    required String? destinationLong,
  }) async {
    emit(const RequestState.createFastRequestLoading());

    var result = await requestRepository.createFastRequest(
      categoryId,
      mettingPointLat,
      mettingPointLong,
      destinationLat,
      destinationLong,
      description,
    );

    result.when(
      success: (CreateFastRequestModel data) {
        emit(RequestState.createFastRequestSuccess(data));
        // print(data.toString());
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(RequestState.completeFastRequestError(networkExceptions));
      },
    );
  }
}
