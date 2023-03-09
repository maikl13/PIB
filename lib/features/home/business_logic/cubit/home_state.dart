import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState<T> with _$HomeState<T> {
  const factory HomeState.idle() = Idle<T>;
  const factory HomeState.loading() = Loading<T>;
  const factory HomeState.error() = Error<T>;
    const factory HomeState.selectedIndexChanged(int index) = SelectedIndexChanged<T>;

}
