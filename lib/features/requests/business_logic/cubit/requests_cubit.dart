import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

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
    try {
      emit(const RequestState.imageSelectedLoading());
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
        emit(RequestState.myRequestsSuccess(requests));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(RequestState.myRequestsError(networkExceptions));
      },
    );
  }

  void getAllAvailableJobs() async {
    emit(const RequestState.myAvailableJobsLoading());

    // ignore: prefer_typing_uninitialized_variables
    var result = await requestRepository.getAllAvailableJobs();
    result.when(
      success: (List<MyRequestModel> availableJobs) {
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
}
