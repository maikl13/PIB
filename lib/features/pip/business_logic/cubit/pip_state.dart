import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pip/features/menu/data/models/update_skill.dart';
import 'package:pip/features/pip/data/models/skills_model.dart';
import '../../../../core/web_services/network_exceptions.dart';
part 'pip_state.freezed.dart';

@freezed
class PipState<T> with _$PipState<T> {
  const factory PipState.idle() = Idle<T>;

  const factory PipState.skillsLoading() = SkillsLoading<T>;

  const factory PipState.skillssuccess(List<SkillModel> data) = SkillsSuccess<T>;

  const factory PipState.skillserror(NetworkExceptions networkExceptions) =
     SkillsError<T>;

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
