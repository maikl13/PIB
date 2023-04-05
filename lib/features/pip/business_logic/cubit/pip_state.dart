import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pip/features/pip/data/models/driver_model.dart';
import 'package:pip/features/pip/data/models/fast_request_category.dart';
import '../../../menu/data/models/update_skill.dart';
import '../../data/models/skills_model.dart';
import '../../../../core/web_services/network_exceptions.dart';
import '../../data/models/toggle_model.dart';
part 'pip_state.freezed.dart';

@freezed
class PipState<T> with _$PipState<T> {
  const factory PipState.idle() = Idle<T>;

  const factory PipState.skillsLoading() = SkillsLoading<T>;

  const factory PipState.skillssuccess(List<SkillModel> data) = SkillsSuccess<T>;

  const factory PipState.skillserror(NetworkExceptions networkExceptions) =
     SkillsError<T>;

  const factory PipState.driverInfoUpdated(DriverModel driver) = DriverInfoUpdated<T>;
  const factory PipState.stopGetDriverInfoStrem() = StopGetDriverInfoStrem<T>;
  const factory PipState.resumeGetDriverInfoStrem() = ResumeGetDriverInfoStrem<T>;






  const factory PipState.driverInfoLoading() = DriverInfoLoading<T>;

  const factory PipState.driverInfoSuccess(DriverModel driver) = DriverInfoSuccess<T>;

  const factory PipState.driverInfoError(NetworkExceptions networkExceptions) =
     DriverInfoError<T>;

      const factory PipState.toggleLoading() = ToggleLoading<T>;

  const factory PipState.toggleSuccess(ToggleModel data) = ToggleSuccess<T>;

  const factory PipState.toggleError(NetworkExceptions networkExceptions) =
     ToggleError<T>;



          const factory PipState.fastRequestCategoryLoading() = FastRequestCategoryLoading<T>;

  const factory PipState.fastRequestCategorySuccess(List<FastRequestCategory> data) = FastRequestCategorySuccess<T>;

  const factory PipState.fastRequestCategoryError(NetworkExceptions networkExceptions) =
     FastRequestCategoryError<T>;


   const factory PipState.imageSelectedSuccess(List<File> images) =
      ImageSelectedSuccess<T>;

      const factory PipState.imageSelectedLoading() =
      ImageSelectedLoading<T>;
      const factory PipState.imageSelectedError() =
      ImageSelectedError<T>;
      const factory PipState.imageSelectedDeleted(List<File> images) =
      ImageSelectedDeleted<T>;

     const factory PipState.createSpecialRequestLoading() = CreateSpecialRequestLoading<T>;

  const factory PipState.createSpecialRequestSuccess(UpdateSkill data) = CreateSpecialRequestSuccess<T>;

  const factory PipState.createSpecialRequestError(NetworkExceptions networkExceptions) =
     CreateSpecialRequestError<T>;
}
