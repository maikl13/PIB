// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() homeSlidersLoading,
    required TResult Function(List<SliderModel> sliders) homeSlidersSuccess,
    required TResult Function(NetworkExceptions networkExceptions)
        homeSlidersError,
    required TResult Function() homeAdsLoading,
    required TResult Function(List<AdModel> ads) homeAdsSuccess,
    required TResult Function(NetworkExceptions networkExceptions) homeAdsError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? homeSlidersLoading,
    TResult? Function(List<SliderModel> sliders)? homeSlidersSuccess,
    TResult? Function(NetworkExceptions networkExceptions)? homeSlidersError,
    TResult? Function()? homeAdsLoading,
    TResult? Function(List<AdModel> ads)? homeAdsSuccess,
    TResult? Function(NetworkExceptions networkExceptions)? homeAdsError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? homeSlidersLoading,
    TResult Function(List<SliderModel> sliders)? homeSlidersSuccess,
    TResult Function(NetworkExceptions networkExceptions)? homeSlidersError,
    TResult Function()? homeAdsLoading,
    TResult Function(List<AdModel> ads)? homeAdsSuccess,
    TResult Function(NetworkExceptions networkExceptions)? homeAdsError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Error<T> value) error,
    required TResult Function(HomeSlidersLoading<T> value) homeSlidersLoading,
    required TResult Function(HomeSlidersSuccess<T> value) homeSlidersSuccess,
    required TResult Function(HomeSlidersError<T> value) homeSlidersError,
    required TResult Function(HomeAdsLoading<T> value) homeAdsLoading,
    required TResult Function(HomeAdsSuccess<T> value) homeAdsSuccess,
    required TResult Function(HomeAdsError<T> value) homeAdsError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Error<T> value)? error,
    TResult? Function(HomeSlidersLoading<T> value)? homeSlidersLoading,
    TResult? Function(HomeSlidersSuccess<T> value)? homeSlidersSuccess,
    TResult? Function(HomeSlidersError<T> value)? homeSlidersError,
    TResult? Function(HomeAdsLoading<T> value)? homeAdsLoading,
    TResult? Function(HomeAdsSuccess<T> value)? homeAdsSuccess,
    TResult? Function(HomeAdsError<T> value)? homeAdsError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Error<T> value)? error,
    TResult Function(HomeSlidersLoading<T> value)? homeSlidersLoading,
    TResult Function(HomeSlidersSuccess<T> value)? homeSlidersSuccess,
    TResult Function(HomeSlidersError<T> value)? homeSlidersError,
    TResult Function(HomeAdsLoading<T> value)? homeAdsLoading,
    TResult Function(HomeAdsSuccess<T> value)? homeAdsSuccess,
    TResult Function(HomeAdsError<T> value)? homeAdsError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<T, $Res> {
  factory $HomeStateCopyWith(
          HomeState<T> value, $Res Function(HomeState<T>) then) =
      _$HomeStateCopyWithImpl<T, $Res, HomeState<T>>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<T, $Res, $Val extends HomeState<T>>
    implements $HomeStateCopyWith<T, $Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IdleCopyWith<T, $Res> {
  factory _$$IdleCopyWith(_$Idle<T> value, $Res Function(_$Idle<T>) then) =
      __$$IdleCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$IdleCopyWithImpl<T, $Res>
    extends _$HomeStateCopyWithImpl<T, $Res, _$Idle<T>>
    implements _$$IdleCopyWith<T, $Res> {
  __$$IdleCopyWithImpl(_$Idle<T> _value, $Res Function(_$Idle<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Idle<T> implements Idle<T> {
  const _$Idle();

  @override
  String toString() {
    return 'HomeState<$T>.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Idle<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() homeSlidersLoading,
    required TResult Function(List<SliderModel> sliders) homeSlidersSuccess,
    required TResult Function(NetworkExceptions networkExceptions)
        homeSlidersError,
    required TResult Function() homeAdsLoading,
    required TResult Function(List<AdModel> ads) homeAdsSuccess,
    required TResult Function(NetworkExceptions networkExceptions) homeAdsError,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? homeSlidersLoading,
    TResult? Function(List<SliderModel> sliders)? homeSlidersSuccess,
    TResult? Function(NetworkExceptions networkExceptions)? homeSlidersError,
    TResult? Function()? homeAdsLoading,
    TResult? Function(List<AdModel> ads)? homeAdsSuccess,
    TResult? Function(NetworkExceptions networkExceptions)? homeAdsError,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? homeSlidersLoading,
    TResult Function(List<SliderModel> sliders)? homeSlidersSuccess,
    TResult Function(NetworkExceptions networkExceptions)? homeSlidersError,
    TResult Function()? homeAdsLoading,
    TResult Function(List<AdModel> ads)? homeAdsSuccess,
    TResult Function(NetworkExceptions networkExceptions)? homeAdsError,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Error<T> value) error,
    required TResult Function(HomeSlidersLoading<T> value) homeSlidersLoading,
    required TResult Function(HomeSlidersSuccess<T> value) homeSlidersSuccess,
    required TResult Function(HomeSlidersError<T> value) homeSlidersError,
    required TResult Function(HomeAdsLoading<T> value) homeAdsLoading,
    required TResult Function(HomeAdsSuccess<T> value) homeAdsSuccess,
    required TResult Function(HomeAdsError<T> value) homeAdsError,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Error<T> value)? error,
    TResult? Function(HomeSlidersLoading<T> value)? homeSlidersLoading,
    TResult? Function(HomeSlidersSuccess<T> value)? homeSlidersSuccess,
    TResult? Function(HomeSlidersError<T> value)? homeSlidersError,
    TResult? Function(HomeAdsLoading<T> value)? homeAdsLoading,
    TResult? Function(HomeAdsSuccess<T> value)? homeAdsSuccess,
    TResult? Function(HomeAdsError<T> value)? homeAdsError,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Error<T> value)? error,
    TResult Function(HomeSlidersLoading<T> value)? homeSlidersLoading,
    TResult Function(HomeSlidersSuccess<T> value)? homeSlidersSuccess,
    TResult Function(HomeSlidersError<T> value)? homeSlidersError,
    TResult Function(HomeAdsLoading<T> value)? homeAdsLoading,
    TResult Function(HomeAdsSuccess<T> value)? homeAdsSuccess,
    TResult Function(HomeAdsError<T> value)? homeAdsError,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle<T> implements HomeState<T> {
  const factory Idle() = _$Idle<T>;
}

/// @nodoc
abstract class _$$LoadingCopyWith<T, $Res> {
  factory _$$LoadingCopyWith(
          _$Loading<T> value, $Res Function(_$Loading<T>) then) =
      __$$LoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<T, $Res>
    extends _$HomeStateCopyWithImpl<T, $Res, _$Loading<T>>
    implements _$$LoadingCopyWith<T, $Res> {
  __$$LoadingCopyWithImpl(
      _$Loading<T> _value, $Res Function(_$Loading<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Loading<T> implements Loading<T> {
  const _$Loading();

  @override
  String toString() {
    return 'HomeState<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Loading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() homeSlidersLoading,
    required TResult Function(List<SliderModel> sliders) homeSlidersSuccess,
    required TResult Function(NetworkExceptions networkExceptions)
        homeSlidersError,
    required TResult Function() homeAdsLoading,
    required TResult Function(List<AdModel> ads) homeAdsSuccess,
    required TResult Function(NetworkExceptions networkExceptions) homeAdsError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? homeSlidersLoading,
    TResult? Function(List<SliderModel> sliders)? homeSlidersSuccess,
    TResult? Function(NetworkExceptions networkExceptions)? homeSlidersError,
    TResult? Function()? homeAdsLoading,
    TResult? Function(List<AdModel> ads)? homeAdsSuccess,
    TResult? Function(NetworkExceptions networkExceptions)? homeAdsError,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? homeSlidersLoading,
    TResult Function(List<SliderModel> sliders)? homeSlidersSuccess,
    TResult Function(NetworkExceptions networkExceptions)? homeSlidersError,
    TResult Function()? homeAdsLoading,
    TResult Function(List<AdModel> ads)? homeAdsSuccess,
    TResult Function(NetworkExceptions networkExceptions)? homeAdsError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Error<T> value) error,
    required TResult Function(HomeSlidersLoading<T> value) homeSlidersLoading,
    required TResult Function(HomeSlidersSuccess<T> value) homeSlidersSuccess,
    required TResult Function(HomeSlidersError<T> value) homeSlidersError,
    required TResult Function(HomeAdsLoading<T> value) homeAdsLoading,
    required TResult Function(HomeAdsSuccess<T> value) homeAdsSuccess,
    required TResult Function(HomeAdsError<T> value) homeAdsError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Error<T> value)? error,
    TResult? Function(HomeSlidersLoading<T> value)? homeSlidersLoading,
    TResult? Function(HomeSlidersSuccess<T> value)? homeSlidersSuccess,
    TResult? Function(HomeSlidersError<T> value)? homeSlidersError,
    TResult? Function(HomeAdsLoading<T> value)? homeAdsLoading,
    TResult? Function(HomeAdsSuccess<T> value)? homeAdsSuccess,
    TResult? Function(HomeAdsError<T> value)? homeAdsError,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Error<T> value)? error,
    TResult Function(HomeSlidersLoading<T> value)? homeSlidersLoading,
    TResult Function(HomeSlidersSuccess<T> value)? homeSlidersSuccess,
    TResult Function(HomeSlidersError<T> value)? homeSlidersError,
    TResult Function(HomeAdsLoading<T> value)? homeAdsLoading,
    TResult Function(HomeAdsSuccess<T> value)? homeAdsSuccess,
    TResult Function(HomeAdsError<T> value)? homeAdsError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading<T> implements HomeState<T> {
  const factory Loading() = _$Loading<T>;
}

/// @nodoc
abstract class _$$ErrorCopyWith<T, $Res> {
  factory _$$ErrorCopyWith(_$Error<T> value, $Res Function(_$Error<T>) then) =
      __$$ErrorCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ErrorCopyWithImpl<T, $Res>
    extends _$HomeStateCopyWithImpl<T, $Res, _$Error<T>>
    implements _$$ErrorCopyWith<T, $Res> {
  __$$ErrorCopyWithImpl(_$Error<T> _value, $Res Function(_$Error<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Error<T> implements Error<T> {
  const _$Error();

  @override
  String toString() {
    return 'HomeState<$T>.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Error<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() homeSlidersLoading,
    required TResult Function(List<SliderModel> sliders) homeSlidersSuccess,
    required TResult Function(NetworkExceptions networkExceptions)
        homeSlidersError,
    required TResult Function() homeAdsLoading,
    required TResult Function(List<AdModel> ads) homeAdsSuccess,
    required TResult Function(NetworkExceptions networkExceptions) homeAdsError,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? homeSlidersLoading,
    TResult? Function(List<SliderModel> sliders)? homeSlidersSuccess,
    TResult? Function(NetworkExceptions networkExceptions)? homeSlidersError,
    TResult? Function()? homeAdsLoading,
    TResult? Function(List<AdModel> ads)? homeAdsSuccess,
    TResult? Function(NetworkExceptions networkExceptions)? homeAdsError,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? homeSlidersLoading,
    TResult Function(List<SliderModel> sliders)? homeSlidersSuccess,
    TResult Function(NetworkExceptions networkExceptions)? homeSlidersError,
    TResult Function()? homeAdsLoading,
    TResult Function(List<AdModel> ads)? homeAdsSuccess,
    TResult Function(NetworkExceptions networkExceptions)? homeAdsError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Error<T> value) error,
    required TResult Function(HomeSlidersLoading<T> value) homeSlidersLoading,
    required TResult Function(HomeSlidersSuccess<T> value) homeSlidersSuccess,
    required TResult Function(HomeSlidersError<T> value) homeSlidersError,
    required TResult Function(HomeAdsLoading<T> value) homeAdsLoading,
    required TResult Function(HomeAdsSuccess<T> value) homeAdsSuccess,
    required TResult Function(HomeAdsError<T> value) homeAdsError,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Error<T> value)? error,
    TResult? Function(HomeSlidersLoading<T> value)? homeSlidersLoading,
    TResult? Function(HomeSlidersSuccess<T> value)? homeSlidersSuccess,
    TResult? Function(HomeSlidersError<T> value)? homeSlidersError,
    TResult? Function(HomeAdsLoading<T> value)? homeAdsLoading,
    TResult? Function(HomeAdsSuccess<T> value)? homeAdsSuccess,
    TResult? Function(HomeAdsError<T> value)? homeAdsError,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Error<T> value)? error,
    TResult Function(HomeSlidersLoading<T> value)? homeSlidersLoading,
    TResult Function(HomeSlidersSuccess<T> value)? homeSlidersSuccess,
    TResult Function(HomeSlidersError<T> value)? homeSlidersError,
    TResult Function(HomeAdsLoading<T> value)? homeAdsLoading,
    TResult Function(HomeAdsSuccess<T> value)? homeAdsSuccess,
    TResult Function(HomeAdsError<T> value)? homeAdsError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error<T> implements HomeState<T> {
  const factory Error() = _$Error<T>;
}

/// @nodoc
abstract class _$$HomeSlidersLoadingCopyWith<T, $Res> {
  factory _$$HomeSlidersLoadingCopyWith(_$HomeSlidersLoading<T> value,
          $Res Function(_$HomeSlidersLoading<T>) then) =
      __$$HomeSlidersLoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$HomeSlidersLoadingCopyWithImpl<T, $Res>
    extends _$HomeStateCopyWithImpl<T, $Res, _$HomeSlidersLoading<T>>
    implements _$$HomeSlidersLoadingCopyWith<T, $Res> {
  __$$HomeSlidersLoadingCopyWithImpl(_$HomeSlidersLoading<T> _value,
      $Res Function(_$HomeSlidersLoading<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$HomeSlidersLoading<T> implements HomeSlidersLoading<T> {
  const _$HomeSlidersLoading();

  @override
  String toString() {
    return 'HomeState<$T>.homeSlidersLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeSlidersLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() homeSlidersLoading,
    required TResult Function(List<SliderModel> sliders) homeSlidersSuccess,
    required TResult Function(NetworkExceptions networkExceptions)
        homeSlidersError,
    required TResult Function() homeAdsLoading,
    required TResult Function(List<AdModel> ads) homeAdsSuccess,
    required TResult Function(NetworkExceptions networkExceptions) homeAdsError,
  }) {
    return homeSlidersLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? homeSlidersLoading,
    TResult? Function(List<SliderModel> sliders)? homeSlidersSuccess,
    TResult? Function(NetworkExceptions networkExceptions)? homeSlidersError,
    TResult? Function()? homeAdsLoading,
    TResult? Function(List<AdModel> ads)? homeAdsSuccess,
    TResult? Function(NetworkExceptions networkExceptions)? homeAdsError,
  }) {
    return homeSlidersLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? homeSlidersLoading,
    TResult Function(List<SliderModel> sliders)? homeSlidersSuccess,
    TResult Function(NetworkExceptions networkExceptions)? homeSlidersError,
    TResult Function()? homeAdsLoading,
    TResult Function(List<AdModel> ads)? homeAdsSuccess,
    TResult Function(NetworkExceptions networkExceptions)? homeAdsError,
    required TResult orElse(),
  }) {
    if (homeSlidersLoading != null) {
      return homeSlidersLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Error<T> value) error,
    required TResult Function(HomeSlidersLoading<T> value) homeSlidersLoading,
    required TResult Function(HomeSlidersSuccess<T> value) homeSlidersSuccess,
    required TResult Function(HomeSlidersError<T> value) homeSlidersError,
    required TResult Function(HomeAdsLoading<T> value) homeAdsLoading,
    required TResult Function(HomeAdsSuccess<T> value) homeAdsSuccess,
    required TResult Function(HomeAdsError<T> value) homeAdsError,
  }) {
    return homeSlidersLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Error<T> value)? error,
    TResult? Function(HomeSlidersLoading<T> value)? homeSlidersLoading,
    TResult? Function(HomeSlidersSuccess<T> value)? homeSlidersSuccess,
    TResult? Function(HomeSlidersError<T> value)? homeSlidersError,
    TResult? Function(HomeAdsLoading<T> value)? homeAdsLoading,
    TResult? Function(HomeAdsSuccess<T> value)? homeAdsSuccess,
    TResult? Function(HomeAdsError<T> value)? homeAdsError,
  }) {
    return homeSlidersLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Error<T> value)? error,
    TResult Function(HomeSlidersLoading<T> value)? homeSlidersLoading,
    TResult Function(HomeSlidersSuccess<T> value)? homeSlidersSuccess,
    TResult Function(HomeSlidersError<T> value)? homeSlidersError,
    TResult Function(HomeAdsLoading<T> value)? homeAdsLoading,
    TResult Function(HomeAdsSuccess<T> value)? homeAdsSuccess,
    TResult Function(HomeAdsError<T> value)? homeAdsError,
    required TResult orElse(),
  }) {
    if (homeSlidersLoading != null) {
      return homeSlidersLoading(this);
    }
    return orElse();
  }
}

abstract class HomeSlidersLoading<T> implements HomeState<T> {
  const factory HomeSlidersLoading() = _$HomeSlidersLoading<T>;
}

/// @nodoc
abstract class _$$HomeSlidersSuccessCopyWith<T, $Res> {
  factory _$$HomeSlidersSuccessCopyWith(_$HomeSlidersSuccess<T> value,
          $Res Function(_$HomeSlidersSuccess<T>) then) =
      __$$HomeSlidersSuccessCopyWithImpl<T, $Res>;
  @useResult
  $Res call({List<SliderModel> sliders});
}

/// @nodoc
class __$$HomeSlidersSuccessCopyWithImpl<T, $Res>
    extends _$HomeStateCopyWithImpl<T, $Res, _$HomeSlidersSuccess<T>>
    implements _$$HomeSlidersSuccessCopyWith<T, $Res> {
  __$$HomeSlidersSuccessCopyWithImpl(_$HomeSlidersSuccess<T> _value,
      $Res Function(_$HomeSlidersSuccess<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sliders = null,
  }) {
    return _then(_$HomeSlidersSuccess<T>(
      null == sliders
          ? _value._sliders
          : sliders // ignore: cast_nullable_to_non_nullable
              as List<SliderModel>,
    ));
  }
}

/// @nodoc

class _$HomeSlidersSuccess<T> implements HomeSlidersSuccess<T> {
  const _$HomeSlidersSuccess(final List<SliderModel> sliders)
      : _sliders = sliders;

  final List<SliderModel> _sliders;
  @override
  List<SliderModel> get sliders {
    if (_sliders is EqualUnmodifiableListView) return _sliders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sliders);
  }

  @override
  String toString() {
    return 'HomeState<$T>.homeSlidersSuccess(sliders: $sliders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeSlidersSuccess<T> &&
            const DeepCollectionEquality().equals(other._sliders, _sliders));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_sliders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeSlidersSuccessCopyWith<T, _$HomeSlidersSuccess<T>> get copyWith =>
      __$$HomeSlidersSuccessCopyWithImpl<T, _$HomeSlidersSuccess<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() homeSlidersLoading,
    required TResult Function(List<SliderModel> sliders) homeSlidersSuccess,
    required TResult Function(NetworkExceptions networkExceptions)
        homeSlidersError,
    required TResult Function() homeAdsLoading,
    required TResult Function(List<AdModel> ads) homeAdsSuccess,
    required TResult Function(NetworkExceptions networkExceptions) homeAdsError,
  }) {
    return homeSlidersSuccess(sliders);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? homeSlidersLoading,
    TResult? Function(List<SliderModel> sliders)? homeSlidersSuccess,
    TResult? Function(NetworkExceptions networkExceptions)? homeSlidersError,
    TResult? Function()? homeAdsLoading,
    TResult? Function(List<AdModel> ads)? homeAdsSuccess,
    TResult? Function(NetworkExceptions networkExceptions)? homeAdsError,
  }) {
    return homeSlidersSuccess?.call(sliders);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? homeSlidersLoading,
    TResult Function(List<SliderModel> sliders)? homeSlidersSuccess,
    TResult Function(NetworkExceptions networkExceptions)? homeSlidersError,
    TResult Function()? homeAdsLoading,
    TResult Function(List<AdModel> ads)? homeAdsSuccess,
    TResult Function(NetworkExceptions networkExceptions)? homeAdsError,
    required TResult orElse(),
  }) {
    if (homeSlidersSuccess != null) {
      return homeSlidersSuccess(sliders);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Error<T> value) error,
    required TResult Function(HomeSlidersLoading<T> value) homeSlidersLoading,
    required TResult Function(HomeSlidersSuccess<T> value) homeSlidersSuccess,
    required TResult Function(HomeSlidersError<T> value) homeSlidersError,
    required TResult Function(HomeAdsLoading<T> value) homeAdsLoading,
    required TResult Function(HomeAdsSuccess<T> value) homeAdsSuccess,
    required TResult Function(HomeAdsError<T> value) homeAdsError,
  }) {
    return homeSlidersSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Error<T> value)? error,
    TResult? Function(HomeSlidersLoading<T> value)? homeSlidersLoading,
    TResult? Function(HomeSlidersSuccess<T> value)? homeSlidersSuccess,
    TResult? Function(HomeSlidersError<T> value)? homeSlidersError,
    TResult? Function(HomeAdsLoading<T> value)? homeAdsLoading,
    TResult? Function(HomeAdsSuccess<T> value)? homeAdsSuccess,
    TResult? Function(HomeAdsError<T> value)? homeAdsError,
  }) {
    return homeSlidersSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Error<T> value)? error,
    TResult Function(HomeSlidersLoading<T> value)? homeSlidersLoading,
    TResult Function(HomeSlidersSuccess<T> value)? homeSlidersSuccess,
    TResult Function(HomeSlidersError<T> value)? homeSlidersError,
    TResult Function(HomeAdsLoading<T> value)? homeAdsLoading,
    TResult Function(HomeAdsSuccess<T> value)? homeAdsSuccess,
    TResult Function(HomeAdsError<T> value)? homeAdsError,
    required TResult orElse(),
  }) {
    if (homeSlidersSuccess != null) {
      return homeSlidersSuccess(this);
    }
    return orElse();
  }
}

abstract class HomeSlidersSuccess<T> implements HomeState<T> {
  const factory HomeSlidersSuccess(final List<SliderModel> sliders) =
      _$HomeSlidersSuccess<T>;

  List<SliderModel> get sliders;
  @JsonKey(ignore: true)
  _$$HomeSlidersSuccessCopyWith<T, _$HomeSlidersSuccess<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomeSlidersErrorCopyWith<T, $Res> {
  factory _$$HomeSlidersErrorCopyWith(_$HomeSlidersError<T> value,
          $Res Function(_$HomeSlidersError<T>) then) =
      __$$HomeSlidersErrorCopyWithImpl<T, $Res>;
  @useResult
  $Res call({NetworkExceptions networkExceptions});

  $NetworkExceptionsCopyWith<$Res> get networkExceptions;
}

/// @nodoc
class __$$HomeSlidersErrorCopyWithImpl<T, $Res>
    extends _$HomeStateCopyWithImpl<T, $Res, _$HomeSlidersError<T>>
    implements _$$HomeSlidersErrorCopyWith<T, $Res> {
  __$$HomeSlidersErrorCopyWithImpl(
      _$HomeSlidersError<T> _value, $Res Function(_$HomeSlidersError<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? networkExceptions = null,
  }) {
    return _then(_$HomeSlidersError<T>(
      null == networkExceptions
          ? _value.networkExceptions
          : networkExceptions // ignore: cast_nullable_to_non_nullable
              as NetworkExceptions,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $NetworkExceptionsCopyWith<$Res> get networkExceptions {
    return $NetworkExceptionsCopyWith<$Res>(_value.networkExceptions, (value) {
      return _then(_value.copyWith(networkExceptions: value));
    });
  }
}

/// @nodoc

class _$HomeSlidersError<T> implements HomeSlidersError<T> {
  const _$HomeSlidersError(this.networkExceptions);

  @override
  final NetworkExceptions networkExceptions;

  @override
  String toString() {
    return 'HomeState<$T>.homeSlidersError(networkExceptions: $networkExceptions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeSlidersError<T> &&
            (identical(other.networkExceptions, networkExceptions) ||
                other.networkExceptions == networkExceptions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, networkExceptions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeSlidersErrorCopyWith<T, _$HomeSlidersError<T>> get copyWith =>
      __$$HomeSlidersErrorCopyWithImpl<T, _$HomeSlidersError<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() homeSlidersLoading,
    required TResult Function(List<SliderModel> sliders) homeSlidersSuccess,
    required TResult Function(NetworkExceptions networkExceptions)
        homeSlidersError,
    required TResult Function() homeAdsLoading,
    required TResult Function(List<AdModel> ads) homeAdsSuccess,
    required TResult Function(NetworkExceptions networkExceptions) homeAdsError,
  }) {
    return homeSlidersError(networkExceptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? homeSlidersLoading,
    TResult? Function(List<SliderModel> sliders)? homeSlidersSuccess,
    TResult? Function(NetworkExceptions networkExceptions)? homeSlidersError,
    TResult? Function()? homeAdsLoading,
    TResult? Function(List<AdModel> ads)? homeAdsSuccess,
    TResult? Function(NetworkExceptions networkExceptions)? homeAdsError,
  }) {
    return homeSlidersError?.call(networkExceptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? homeSlidersLoading,
    TResult Function(List<SliderModel> sliders)? homeSlidersSuccess,
    TResult Function(NetworkExceptions networkExceptions)? homeSlidersError,
    TResult Function()? homeAdsLoading,
    TResult Function(List<AdModel> ads)? homeAdsSuccess,
    TResult Function(NetworkExceptions networkExceptions)? homeAdsError,
    required TResult orElse(),
  }) {
    if (homeSlidersError != null) {
      return homeSlidersError(networkExceptions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Error<T> value) error,
    required TResult Function(HomeSlidersLoading<T> value) homeSlidersLoading,
    required TResult Function(HomeSlidersSuccess<T> value) homeSlidersSuccess,
    required TResult Function(HomeSlidersError<T> value) homeSlidersError,
    required TResult Function(HomeAdsLoading<T> value) homeAdsLoading,
    required TResult Function(HomeAdsSuccess<T> value) homeAdsSuccess,
    required TResult Function(HomeAdsError<T> value) homeAdsError,
  }) {
    return homeSlidersError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Error<T> value)? error,
    TResult? Function(HomeSlidersLoading<T> value)? homeSlidersLoading,
    TResult? Function(HomeSlidersSuccess<T> value)? homeSlidersSuccess,
    TResult? Function(HomeSlidersError<T> value)? homeSlidersError,
    TResult? Function(HomeAdsLoading<T> value)? homeAdsLoading,
    TResult? Function(HomeAdsSuccess<T> value)? homeAdsSuccess,
    TResult? Function(HomeAdsError<T> value)? homeAdsError,
  }) {
    return homeSlidersError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Error<T> value)? error,
    TResult Function(HomeSlidersLoading<T> value)? homeSlidersLoading,
    TResult Function(HomeSlidersSuccess<T> value)? homeSlidersSuccess,
    TResult Function(HomeSlidersError<T> value)? homeSlidersError,
    TResult Function(HomeAdsLoading<T> value)? homeAdsLoading,
    TResult Function(HomeAdsSuccess<T> value)? homeAdsSuccess,
    TResult Function(HomeAdsError<T> value)? homeAdsError,
    required TResult orElse(),
  }) {
    if (homeSlidersError != null) {
      return homeSlidersError(this);
    }
    return orElse();
  }
}

abstract class HomeSlidersError<T> implements HomeState<T> {
  const factory HomeSlidersError(final NetworkExceptions networkExceptions) =
      _$HomeSlidersError<T>;

  NetworkExceptions get networkExceptions;
  @JsonKey(ignore: true)
  _$$HomeSlidersErrorCopyWith<T, _$HomeSlidersError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomeAdsLoadingCopyWith<T, $Res> {
  factory _$$HomeAdsLoadingCopyWith(
          _$HomeAdsLoading<T> value, $Res Function(_$HomeAdsLoading<T>) then) =
      __$$HomeAdsLoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$HomeAdsLoadingCopyWithImpl<T, $Res>
    extends _$HomeStateCopyWithImpl<T, $Res, _$HomeAdsLoading<T>>
    implements _$$HomeAdsLoadingCopyWith<T, $Res> {
  __$$HomeAdsLoadingCopyWithImpl(
      _$HomeAdsLoading<T> _value, $Res Function(_$HomeAdsLoading<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$HomeAdsLoading<T> implements HomeAdsLoading<T> {
  const _$HomeAdsLoading();

  @override
  String toString() {
    return 'HomeState<$T>.homeAdsLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeAdsLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() homeSlidersLoading,
    required TResult Function(List<SliderModel> sliders) homeSlidersSuccess,
    required TResult Function(NetworkExceptions networkExceptions)
        homeSlidersError,
    required TResult Function() homeAdsLoading,
    required TResult Function(List<AdModel> ads) homeAdsSuccess,
    required TResult Function(NetworkExceptions networkExceptions) homeAdsError,
  }) {
    return homeAdsLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? homeSlidersLoading,
    TResult? Function(List<SliderModel> sliders)? homeSlidersSuccess,
    TResult? Function(NetworkExceptions networkExceptions)? homeSlidersError,
    TResult? Function()? homeAdsLoading,
    TResult? Function(List<AdModel> ads)? homeAdsSuccess,
    TResult? Function(NetworkExceptions networkExceptions)? homeAdsError,
  }) {
    return homeAdsLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? homeSlidersLoading,
    TResult Function(List<SliderModel> sliders)? homeSlidersSuccess,
    TResult Function(NetworkExceptions networkExceptions)? homeSlidersError,
    TResult Function()? homeAdsLoading,
    TResult Function(List<AdModel> ads)? homeAdsSuccess,
    TResult Function(NetworkExceptions networkExceptions)? homeAdsError,
    required TResult orElse(),
  }) {
    if (homeAdsLoading != null) {
      return homeAdsLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Error<T> value) error,
    required TResult Function(HomeSlidersLoading<T> value) homeSlidersLoading,
    required TResult Function(HomeSlidersSuccess<T> value) homeSlidersSuccess,
    required TResult Function(HomeSlidersError<T> value) homeSlidersError,
    required TResult Function(HomeAdsLoading<T> value) homeAdsLoading,
    required TResult Function(HomeAdsSuccess<T> value) homeAdsSuccess,
    required TResult Function(HomeAdsError<T> value) homeAdsError,
  }) {
    return homeAdsLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Error<T> value)? error,
    TResult? Function(HomeSlidersLoading<T> value)? homeSlidersLoading,
    TResult? Function(HomeSlidersSuccess<T> value)? homeSlidersSuccess,
    TResult? Function(HomeSlidersError<T> value)? homeSlidersError,
    TResult? Function(HomeAdsLoading<T> value)? homeAdsLoading,
    TResult? Function(HomeAdsSuccess<T> value)? homeAdsSuccess,
    TResult? Function(HomeAdsError<T> value)? homeAdsError,
  }) {
    return homeAdsLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Error<T> value)? error,
    TResult Function(HomeSlidersLoading<T> value)? homeSlidersLoading,
    TResult Function(HomeSlidersSuccess<T> value)? homeSlidersSuccess,
    TResult Function(HomeSlidersError<T> value)? homeSlidersError,
    TResult Function(HomeAdsLoading<T> value)? homeAdsLoading,
    TResult Function(HomeAdsSuccess<T> value)? homeAdsSuccess,
    TResult Function(HomeAdsError<T> value)? homeAdsError,
    required TResult orElse(),
  }) {
    if (homeAdsLoading != null) {
      return homeAdsLoading(this);
    }
    return orElse();
  }
}

abstract class HomeAdsLoading<T> implements HomeState<T> {
  const factory HomeAdsLoading() = _$HomeAdsLoading<T>;
}

/// @nodoc
abstract class _$$HomeAdsSuccessCopyWith<T, $Res> {
  factory _$$HomeAdsSuccessCopyWith(
          _$HomeAdsSuccess<T> value, $Res Function(_$HomeAdsSuccess<T>) then) =
      __$$HomeAdsSuccessCopyWithImpl<T, $Res>;
  @useResult
  $Res call({List<AdModel> ads});
}

/// @nodoc
class __$$HomeAdsSuccessCopyWithImpl<T, $Res>
    extends _$HomeStateCopyWithImpl<T, $Res, _$HomeAdsSuccess<T>>
    implements _$$HomeAdsSuccessCopyWith<T, $Res> {
  __$$HomeAdsSuccessCopyWithImpl(
      _$HomeAdsSuccess<T> _value, $Res Function(_$HomeAdsSuccess<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ads = null,
  }) {
    return _then(_$HomeAdsSuccess<T>(
      null == ads
          ? _value._ads
          : ads // ignore: cast_nullable_to_non_nullable
              as List<AdModel>,
    ));
  }
}

/// @nodoc

class _$HomeAdsSuccess<T> implements HomeAdsSuccess<T> {
  const _$HomeAdsSuccess(final List<AdModel> ads) : _ads = ads;

  final List<AdModel> _ads;
  @override
  List<AdModel> get ads {
    if (_ads is EqualUnmodifiableListView) return _ads;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ads);
  }

  @override
  String toString() {
    return 'HomeState<$T>.homeAdsSuccess(ads: $ads)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeAdsSuccess<T> &&
            const DeepCollectionEquality().equals(other._ads, _ads));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_ads));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeAdsSuccessCopyWith<T, _$HomeAdsSuccess<T>> get copyWith =>
      __$$HomeAdsSuccessCopyWithImpl<T, _$HomeAdsSuccess<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() homeSlidersLoading,
    required TResult Function(List<SliderModel> sliders) homeSlidersSuccess,
    required TResult Function(NetworkExceptions networkExceptions)
        homeSlidersError,
    required TResult Function() homeAdsLoading,
    required TResult Function(List<AdModel> ads) homeAdsSuccess,
    required TResult Function(NetworkExceptions networkExceptions) homeAdsError,
  }) {
    return homeAdsSuccess(ads);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? homeSlidersLoading,
    TResult? Function(List<SliderModel> sliders)? homeSlidersSuccess,
    TResult? Function(NetworkExceptions networkExceptions)? homeSlidersError,
    TResult? Function()? homeAdsLoading,
    TResult? Function(List<AdModel> ads)? homeAdsSuccess,
    TResult? Function(NetworkExceptions networkExceptions)? homeAdsError,
  }) {
    return homeAdsSuccess?.call(ads);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? homeSlidersLoading,
    TResult Function(List<SliderModel> sliders)? homeSlidersSuccess,
    TResult Function(NetworkExceptions networkExceptions)? homeSlidersError,
    TResult Function()? homeAdsLoading,
    TResult Function(List<AdModel> ads)? homeAdsSuccess,
    TResult Function(NetworkExceptions networkExceptions)? homeAdsError,
    required TResult orElse(),
  }) {
    if (homeAdsSuccess != null) {
      return homeAdsSuccess(ads);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Error<T> value) error,
    required TResult Function(HomeSlidersLoading<T> value) homeSlidersLoading,
    required TResult Function(HomeSlidersSuccess<T> value) homeSlidersSuccess,
    required TResult Function(HomeSlidersError<T> value) homeSlidersError,
    required TResult Function(HomeAdsLoading<T> value) homeAdsLoading,
    required TResult Function(HomeAdsSuccess<T> value) homeAdsSuccess,
    required TResult Function(HomeAdsError<T> value) homeAdsError,
  }) {
    return homeAdsSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Error<T> value)? error,
    TResult? Function(HomeSlidersLoading<T> value)? homeSlidersLoading,
    TResult? Function(HomeSlidersSuccess<T> value)? homeSlidersSuccess,
    TResult? Function(HomeSlidersError<T> value)? homeSlidersError,
    TResult? Function(HomeAdsLoading<T> value)? homeAdsLoading,
    TResult? Function(HomeAdsSuccess<T> value)? homeAdsSuccess,
    TResult? Function(HomeAdsError<T> value)? homeAdsError,
  }) {
    return homeAdsSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Error<T> value)? error,
    TResult Function(HomeSlidersLoading<T> value)? homeSlidersLoading,
    TResult Function(HomeSlidersSuccess<T> value)? homeSlidersSuccess,
    TResult Function(HomeSlidersError<T> value)? homeSlidersError,
    TResult Function(HomeAdsLoading<T> value)? homeAdsLoading,
    TResult Function(HomeAdsSuccess<T> value)? homeAdsSuccess,
    TResult Function(HomeAdsError<T> value)? homeAdsError,
    required TResult orElse(),
  }) {
    if (homeAdsSuccess != null) {
      return homeAdsSuccess(this);
    }
    return orElse();
  }
}

abstract class HomeAdsSuccess<T> implements HomeState<T> {
  const factory HomeAdsSuccess(final List<AdModel> ads) = _$HomeAdsSuccess<T>;

  List<AdModel> get ads;
  @JsonKey(ignore: true)
  _$$HomeAdsSuccessCopyWith<T, _$HomeAdsSuccess<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomeAdsErrorCopyWith<T, $Res> {
  factory _$$HomeAdsErrorCopyWith(
          _$HomeAdsError<T> value, $Res Function(_$HomeAdsError<T>) then) =
      __$$HomeAdsErrorCopyWithImpl<T, $Res>;
  @useResult
  $Res call({NetworkExceptions networkExceptions});

  $NetworkExceptionsCopyWith<$Res> get networkExceptions;
}

/// @nodoc
class __$$HomeAdsErrorCopyWithImpl<T, $Res>
    extends _$HomeStateCopyWithImpl<T, $Res, _$HomeAdsError<T>>
    implements _$$HomeAdsErrorCopyWith<T, $Res> {
  __$$HomeAdsErrorCopyWithImpl(
      _$HomeAdsError<T> _value, $Res Function(_$HomeAdsError<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? networkExceptions = null,
  }) {
    return _then(_$HomeAdsError<T>(
      null == networkExceptions
          ? _value.networkExceptions
          : networkExceptions // ignore: cast_nullable_to_non_nullable
              as NetworkExceptions,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $NetworkExceptionsCopyWith<$Res> get networkExceptions {
    return $NetworkExceptionsCopyWith<$Res>(_value.networkExceptions, (value) {
      return _then(_value.copyWith(networkExceptions: value));
    });
  }
}

/// @nodoc

class _$HomeAdsError<T> implements HomeAdsError<T> {
  const _$HomeAdsError(this.networkExceptions);

  @override
  final NetworkExceptions networkExceptions;

  @override
  String toString() {
    return 'HomeState<$T>.homeAdsError(networkExceptions: $networkExceptions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeAdsError<T> &&
            (identical(other.networkExceptions, networkExceptions) ||
                other.networkExceptions == networkExceptions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, networkExceptions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeAdsErrorCopyWith<T, _$HomeAdsError<T>> get copyWith =>
      __$$HomeAdsErrorCopyWithImpl<T, _$HomeAdsError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() homeSlidersLoading,
    required TResult Function(List<SliderModel> sliders) homeSlidersSuccess,
    required TResult Function(NetworkExceptions networkExceptions)
        homeSlidersError,
    required TResult Function() homeAdsLoading,
    required TResult Function(List<AdModel> ads) homeAdsSuccess,
    required TResult Function(NetworkExceptions networkExceptions) homeAdsError,
  }) {
    return homeAdsError(networkExceptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? homeSlidersLoading,
    TResult? Function(List<SliderModel> sliders)? homeSlidersSuccess,
    TResult? Function(NetworkExceptions networkExceptions)? homeSlidersError,
    TResult? Function()? homeAdsLoading,
    TResult? Function(List<AdModel> ads)? homeAdsSuccess,
    TResult? Function(NetworkExceptions networkExceptions)? homeAdsError,
  }) {
    return homeAdsError?.call(networkExceptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? homeSlidersLoading,
    TResult Function(List<SliderModel> sliders)? homeSlidersSuccess,
    TResult Function(NetworkExceptions networkExceptions)? homeSlidersError,
    TResult Function()? homeAdsLoading,
    TResult Function(List<AdModel> ads)? homeAdsSuccess,
    TResult Function(NetworkExceptions networkExceptions)? homeAdsError,
    required TResult orElse(),
  }) {
    if (homeAdsError != null) {
      return homeAdsError(networkExceptions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Error<T> value) error,
    required TResult Function(HomeSlidersLoading<T> value) homeSlidersLoading,
    required TResult Function(HomeSlidersSuccess<T> value) homeSlidersSuccess,
    required TResult Function(HomeSlidersError<T> value) homeSlidersError,
    required TResult Function(HomeAdsLoading<T> value) homeAdsLoading,
    required TResult Function(HomeAdsSuccess<T> value) homeAdsSuccess,
    required TResult Function(HomeAdsError<T> value) homeAdsError,
  }) {
    return homeAdsError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Error<T> value)? error,
    TResult? Function(HomeSlidersLoading<T> value)? homeSlidersLoading,
    TResult? Function(HomeSlidersSuccess<T> value)? homeSlidersSuccess,
    TResult? Function(HomeSlidersError<T> value)? homeSlidersError,
    TResult? Function(HomeAdsLoading<T> value)? homeAdsLoading,
    TResult? Function(HomeAdsSuccess<T> value)? homeAdsSuccess,
    TResult? Function(HomeAdsError<T> value)? homeAdsError,
  }) {
    return homeAdsError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Error<T> value)? error,
    TResult Function(HomeSlidersLoading<T> value)? homeSlidersLoading,
    TResult Function(HomeSlidersSuccess<T> value)? homeSlidersSuccess,
    TResult Function(HomeSlidersError<T> value)? homeSlidersError,
    TResult Function(HomeAdsLoading<T> value)? homeAdsLoading,
    TResult Function(HomeAdsSuccess<T> value)? homeAdsSuccess,
    TResult Function(HomeAdsError<T> value)? homeAdsError,
    required TResult orElse(),
  }) {
    if (homeAdsError != null) {
      return homeAdsError(this);
    }
    return orElse();
  }
}

abstract class HomeAdsError<T> implements HomeState<T> {
  const factory HomeAdsError(final NetworkExceptions networkExceptions) =
      _$HomeAdsError<T>;

  NetworkExceptions get networkExceptions;
  @JsonKey(ignore: true)
  _$$HomeAdsErrorCopyWith<T, _$HomeAdsError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
