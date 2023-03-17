import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pip/features/pip/data/models/skills_model.dart';
import '../../../../core/web_services/network_exceptions.dart';
part 'pip_state.freezed.dart';

@freezed
class PipState<T> with _$PipState<T> {
  const factory PipState.idle() = Idle<T>;

  const factory PipState.loading() = Loading<T>;

  const factory PipState.success(List<SkillModel> data) = Success<T>;

  const factory PipState.error(NetworkExceptions networkExceptions) =
      Error<T>;
}
