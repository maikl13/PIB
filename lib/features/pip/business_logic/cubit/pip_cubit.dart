import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:pip/features/pip/data/models/fast_request_category.dart';
import 'package:pip/features/pip/data/models/toggle_model.dart';
import '../../../menu/data/models/update_skill.dart';
import 'pip_state.dart';
import '../../data/models/skills_model.dart';
import '../../data/repository/pip_repository.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/resources/commons.dart';
import '../../../../core/web_services/network_exceptions.dart';

class PipCubit extends Cubit<PipState> {
  PipCubit(this.pipRepsitory) : super(const PipState.idle());

  final PipRepsitory pipRepsitory;
  


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

    emit(PipState.imageSelectedDeleted(imagesFile));
  }

  Future pickImage() async {
    try {
      emit(const PipState.imageSelectedLoading());
      final List<XFile> images = await ImagePicker().pickMultiImage();

      final imagesList = images.map((e) => File(e.path)).toList();
      imagesFile.addAll(imagesList);

      emit(PipState.imageSelectedSuccess(imagesFile));
    } on PlatformException catch (e) {
      emit(const PipState.imageSelectedError());
      Commons.showToast(message: e.toString());
      // print('Failed to pick image $e ');
    }
  }

  void getAllSkills() async {
    emit(const PipState.skillsLoading());

    // ignore: prefer_typing_uninitialized_variables
    var result = await pipRepsitory.getAllSkills();
    result.when(
      success: (List<SkillModel> skills) {
        emit(PipState.skillssuccess(skills));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(PipState.skillserror(networkExceptions));
      },
    );
  }

  void getAllFastRequestCategories() async {
    emit(const PipState.fastRequestCategoryLoading());

    // ignore: prefer_typing_uninitialized_variables
    var result = await pipRepsitory.getAllFastRequestCategories();
    result.when(
      success: (List<FastRequestCategory> categories) {
        emit(PipState.fastRequestCategorySuccess(categories));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(PipState.fastRequestCategoryError(networkExceptions));
      },
    );
  }

  void createSpecialRequest({
    String? categoryId,
    String? price,
    String? location,
    String? description,
    File? image,
  }) async {
    emit(const PipState.createSpecialRequestLoading());

    // ignore: prefer_typing_uninitialized_variables
    var result = imagesFile.isEmpty
        ? await pipRepsitory.createSpecialWithoutImageRequest(
            categoryId!, price!, location!, description!)
        : await pipRepsitory.createSpecialRequest(
            categoryId!, price!, location!, description!, imagesFile);

    result.when(
      success: (UpdateSkill data) {
        emit(PipState.createSpecialRequestSuccess(data));
        // print(data.toString());
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(PipState.createSpecialRequestError(networkExceptions));
      },
    );
  }


  void toggleFastRequest() async {
    emit(const PipState.toggleLoading());

    var result = await pipRepsitory.toggleFastRequest();
    result.when(
      success: (ToggleModel data) {
        emit(PipState.toggleSuccess(data));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(PipState.toggleError(networkExceptions));
      },
    );
  }

}
