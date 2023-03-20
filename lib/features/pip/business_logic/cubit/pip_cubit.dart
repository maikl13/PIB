import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:pip/features/menu/data/models/update_skill.dart';
import 'package:pip/features/pip/business_logic/cubit/pip_state.dart';
import 'package:pip/features/pip/data/models/skills_model.dart';
import 'package:pip/features/pip/data/repository/pip_repository.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/resources/commons.dart';
import '../../../../core/web_services/network_exceptions.dart';

class PipCubit extends Cubit<PipState> {
  PipCubit(this.pipRepsitory) : super(const PipState.idle());

  final PipRepsitory pipRepsitory;

  List<File> imagesFile = [];
  deleteImage(int index) {
    imagesFile.removeAt(index);
    emit( PipState.imageSelectedDeleted(imagesFile));
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
      print('Failed to pick image $e ');
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

  void createSpecialRequest({
    String? categoryId,
    String? price,
    String? location,
    String? description,
    File? image,
  }) async {
    emit(const PipState.createSpecialRequestLoading());

    // ignore: prefer_typing_uninitialized_variables
    var result = imagesFile == null
        ? await pipRepsitory.createSpecialWithoutImageRequest(
            categoryId!, price!, location!, description!)
        : await pipRepsitory.createSpecialRequest(
            categoryId!, price!, location!, description!, imagesFile);

    result.when(
      success: (UpdateSkill data) {
        emit(PipState.createSpecialRequestSuccess(data));
        print(data.toString());
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(PipState.createSpecialRequestError(networkExceptions));
      },
    );
  }
}
