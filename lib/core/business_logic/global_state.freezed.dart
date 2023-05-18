// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'global_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GlobalState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() getUnreadNotificationCountLoading,
    required TResult Function(UnreadNotificationCount count)
        getUnreadNotificationCountSuccess,
    required TResult Function(T data) getUnreadNotificationCountError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? getUnreadNotificationCountLoading,
    TResult? Function(UnreadNotificationCount count)?
        getUnreadNotificationCountSuccess,
    TResult? Function(T data)? getUnreadNotificationCountError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? getUnreadNotificationCountLoading,
    TResult Function(UnreadNotificationCount count)?
        getUnreadNotificationCountSuccess,
    TResult Function(T data)? getUnreadNotificationCountError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(GetUnreadNotificationCountLoading<T> value)
        getUnreadNotificationCountLoading,
    required TResult Function(GetUnreadNotificationCountSuccess<T> value)
        getUnreadNotificationCountSuccess,
    required TResult Function(GetUnreadNotificationCountError<T> value)
        getUnreadNotificationCountError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(GetUnreadNotificationCountLoading<T> value)?
        getUnreadNotificationCountLoading,
    TResult? Function(GetUnreadNotificationCountSuccess<T> value)?
        getUnreadNotificationCountSuccess,
    TResult? Function(GetUnreadNotificationCountError<T> value)?
        getUnreadNotificationCountError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(GetUnreadNotificationCountLoading<T> value)?
        getUnreadNotificationCountLoading,
    TResult Function(GetUnreadNotificationCountSuccess<T> value)?
        getUnreadNotificationCountSuccess,
    TResult Function(GetUnreadNotificationCountError<T> value)?
        getUnreadNotificationCountError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalStateCopyWith<T, $Res> {
  factory $GlobalStateCopyWith(
          GlobalState<T> value, $Res Function(GlobalState<T>) then) =
      _$GlobalStateCopyWithImpl<T, $Res, GlobalState<T>>;
}

/// @nodoc
class _$GlobalStateCopyWithImpl<T, $Res, $Val extends GlobalState<T>>
    implements $GlobalStateCopyWith<T, $Res> {
  _$GlobalStateCopyWithImpl(this._value, this._then);

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
    extends _$GlobalStateCopyWithImpl<T, $Res, _$Idle<T>>
    implements _$$IdleCopyWith<T, $Res> {
  __$$IdleCopyWithImpl(_$Idle<T> _value, $Res Function(_$Idle<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Idle<T> implements Idle<T> {
  const _$Idle();

  @override
  String toString() {
    return 'GlobalState<$T>.idle()';
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
    required TResult Function() getUnreadNotificationCountLoading,
    required TResult Function(UnreadNotificationCount count)
        getUnreadNotificationCountSuccess,
    required TResult Function(T data) getUnreadNotificationCountError,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? getUnreadNotificationCountLoading,
    TResult? Function(UnreadNotificationCount count)?
        getUnreadNotificationCountSuccess,
    TResult? Function(T data)? getUnreadNotificationCountError,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? getUnreadNotificationCountLoading,
    TResult Function(UnreadNotificationCount count)?
        getUnreadNotificationCountSuccess,
    TResult Function(T data)? getUnreadNotificationCountError,
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
    required TResult Function(GetUnreadNotificationCountLoading<T> value)
        getUnreadNotificationCountLoading,
    required TResult Function(GetUnreadNotificationCountSuccess<T> value)
        getUnreadNotificationCountSuccess,
    required TResult Function(GetUnreadNotificationCountError<T> value)
        getUnreadNotificationCountError,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(GetUnreadNotificationCountLoading<T> value)?
        getUnreadNotificationCountLoading,
    TResult? Function(GetUnreadNotificationCountSuccess<T> value)?
        getUnreadNotificationCountSuccess,
    TResult? Function(GetUnreadNotificationCountError<T> value)?
        getUnreadNotificationCountError,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(GetUnreadNotificationCountLoading<T> value)?
        getUnreadNotificationCountLoading,
    TResult Function(GetUnreadNotificationCountSuccess<T> value)?
        getUnreadNotificationCountSuccess,
    TResult Function(GetUnreadNotificationCountError<T> value)?
        getUnreadNotificationCountError,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle<T> implements GlobalState<T> {
  const factory Idle() = _$Idle<T>;
}

/// @nodoc
abstract class _$$GetUnreadNotificationCountLoadingCopyWith<T, $Res> {
  factory _$$GetUnreadNotificationCountLoadingCopyWith(
          _$GetUnreadNotificationCountLoading<T> value,
          $Res Function(_$GetUnreadNotificationCountLoading<T>) then) =
      __$$GetUnreadNotificationCountLoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$GetUnreadNotificationCountLoadingCopyWithImpl<T, $Res>
    extends _$GlobalStateCopyWithImpl<T, $Res,
        _$GetUnreadNotificationCountLoading<T>>
    implements _$$GetUnreadNotificationCountLoadingCopyWith<T, $Res> {
  __$$GetUnreadNotificationCountLoadingCopyWithImpl(
      _$GetUnreadNotificationCountLoading<T> _value,
      $Res Function(_$GetUnreadNotificationCountLoading<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetUnreadNotificationCountLoading<T>
    implements GetUnreadNotificationCountLoading<T> {
  const _$GetUnreadNotificationCountLoading();

  @override
  String toString() {
    return 'GlobalState<$T>.getUnreadNotificationCountLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUnreadNotificationCountLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() getUnreadNotificationCountLoading,
    required TResult Function(UnreadNotificationCount count)
        getUnreadNotificationCountSuccess,
    required TResult Function(T data) getUnreadNotificationCountError,
  }) {
    return getUnreadNotificationCountLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? getUnreadNotificationCountLoading,
    TResult? Function(UnreadNotificationCount count)?
        getUnreadNotificationCountSuccess,
    TResult? Function(T data)? getUnreadNotificationCountError,
  }) {
    return getUnreadNotificationCountLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? getUnreadNotificationCountLoading,
    TResult Function(UnreadNotificationCount count)?
        getUnreadNotificationCountSuccess,
    TResult Function(T data)? getUnreadNotificationCountError,
    required TResult orElse(),
  }) {
    if (getUnreadNotificationCountLoading != null) {
      return getUnreadNotificationCountLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(GetUnreadNotificationCountLoading<T> value)
        getUnreadNotificationCountLoading,
    required TResult Function(GetUnreadNotificationCountSuccess<T> value)
        getUnreadNotificationCountSuccess,
    required TResult Function(GetUnreadNotificationCountError<T> value)
        getUnreadNotificationCountError,
  }) {
    return getUnreadNotificationCountLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(GetUnreadNotificationCountLoading<T> value)?
        getUnreadNotificationCountLoading,
    TResult? Function(GetUnreadNotificationCountSuccess<T> value)?
        getUnreadNotificationCountSuccess,
    TResult? Function(GetUnreadNotificationCountError<T> value)?
        getUnreadNotificationCountError,
  }) {
    return getUnreadNotificationCountLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(GetUnreadNotificationCountLoading<T> value)?
        getUnreadNotificationCountLoading,
    TResult Function(GetUnreadNotificationCountSuccess<T> value)?
        getUnreadNotificationCountSuccess,
    TResult Function(GetUnreadNotificationCountError<T> value)?
        getUnreadNotificationCountError,
    required TResult orElse(),
  }) {
    if (getUnreadNotificationCountLoading != null) {
      return getUnreadNotificationCountLoading(this);
    }
    return orElse();
  }
}

abstract class GetUnreadNotificationCountLoading<T> implements GlobalState<T> {
  const factory GetUnreadNotificationCountLoading() =
      _$GetUnreadNotificationCountLoading<T>;
}

/// @nodoc
abstract class _$$GetUnreadNotificationCountSuccessCopyWith<T, $Res> {
  factory _$$GetUnreadNotificationCountSuccessCopyWith(
          _$GetUnreadNotificationCountSuccess<T> value,
          $Res Function(_$GetUnreadNotificationCountSuccess<T>) then) =
      __$$GetUnreadNotificationCountSuccessCopyWithImpl<T, $Res>;
  @useResult
  $Res call({UnreadNotificationCount count});
}

/// @nodoc
class __$$GetUnreadNotificationCountSuccessCopyWithImpl<T, $Res>
    extends _$GlobalStateCopyWithImpl<T, $Res,
        _$GetUnreadNotificationCountSuccess<T>>
    implements _$$GetUnreadNotificationCountSuccessCopyWith<T, $Res> {
  __$$GetUnreadNotificationCountSuccessCopyWithImpl(
      _$GetUnreadNotificationCountSuccess<T> _value,
      $Res Function(_$GetUnreadNotificationCountSuccess<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
  }) {
    return _then(_$GetUnreadNotificationCountSuccess<T>(
      null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as UnreadNotificationCount,
    ));
  }
}

/// @nodoc

class _$GetUnreadNotificationCountSuccess<T>
    implements GetUnreadNotificationCountSuccess<T> {
  const _$GetUnreadNotificationCountSuccess(this.count);

  @override
  final UnreadNotificationCount count;

  @override
  String toString() {
    return 'GlobalState<$T>.getUnreadNotificationCountSuccess(count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUnreadNotificationCountSuccess<T> &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUnreadNotificationCountSuccessCopyWith<T,
          _$GetUnreadNotificationCountSuccess<T>>
      get copyWith => __$$GetUnreadNotificationCountSuccessCopyWithImpl<T,
          _$GetUnreadNotificationCountSuccess<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() getUnreadNotificationCountLoading,
    required TResult Function(UnreadNotificationCount count)
        getUnreadNotificationCountSuccess,
    required TResult Function(T data) getUnreadNotificationCountError,
  }) {
    return getUnreadNotificationCountSuccess(count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? getUnreadNotificationCountLoading,
    TResult? Function(UnreadNotificationCount count)?
        getUnreadNotificationCountSuccess,
    TResult? Function(T data)? getUnreadNotificationCountError,
  }) {
    return getUnreadNotificationCountSuccess?.call(count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? getUnreadNotificationCountLoading,
    TResult Function(UnreadNotificationCount count)?
        getUnreadNotificationCountSuccess,
    TResult Function(T data)? getUnreadNotificationCountError,
    required TResult orElse(),
  }) {
    if (getUnreadNotificationCountSuccess != null) {
      return getUnreadNotificationCountSuccess(count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(GetUnreadNotificationCountLoading<T> value)
        getUnreadNotificationCountLoading,
    required TResult Function(GetUnreadNotificationCountSuccess<T> value)
        getUnreadNotificationCountSuccess,
    required TResult Function(GetUnreadNotificationCountError<T> value)
        getUnreadNotificationCountError,
  }) {
    return getUnreadNotificationCountSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(GetUnreadNotificationCountLoading<T> value)?
        getUnreadNotificationCountLoading,
    TResult? Function(GetUnreadNotificationCountSuccess<T> value)?
        getUnreadNotificationCountSuccess,
    TResult? Function(GetUnreadNotificationCountError<T> value)?
        getUnreadNotificationCountError,
  }) {
    return getUnreadNotificationCountSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(GetUnreadNotificationCountLoading<T> value)?
        getUnreadNotificationCountLoading,
    TResult Function(GetUnreadNotificationCountSuccess<T> value)?
        getUnreadNotificationCountSuccess,
    TResult Function(GetUnreadNotificationCountError<T> value)?
        getUnreadNotificationCountError,
    required TResult orElse(),
  }) {
    if (getUnreadNotificationCountSuccess != null) {
      return getUnreadNotificationCountSuccess(this);
    }
    return orElse();
  }
}

abstract class GetUnreadNotificationCountSuccess<T> implements GlobalState<T> {
  const factory GetUnreadNotificationCountSuccess(
          final UnreadNotificationCount count) =
      _$GetUnreadNotificationCountSuccess<T>;

  UnreadNotificationCount get count;
  @JsonKey(ignore: true)
  _$$GetUnreadNotificationCountSuccessCopyWith<T,
          _$GetUnreadNotificationCountSuccess<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetUnreadNotificationCountErrorCopyWith<T, $Res> {
  factory _$$GetUnreadNotificationCountErrorCopyWith(
          _$GetUnreadNotificationCountError<T> value,
          $Res Function(_$GetUnreadNotificationCountError<T>) then) =
      __$$GetUnreadNotificationCountErrorCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$GetUnreadNotificationCountErrorCopyWithImpl<T, $Res>
    extends _$GlobalStateCopyWithImpl<T, $Res,
        _$GetUnreadNotificationCountError<T>>
    implements _$$GetUnreadNotificationCountErrorCopyWith<T, $Res> {
  __$$GetUnreadNotificationCountErrorCopyWithImpl(
      _$GetUnreadNotificationCountError<T> _value,
      $Res Function(_$GetUnreadNotificationCountError<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$GetUnreadNotificationCountError<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$GetUnreadNotificationCountError<T>
    implements GetUnreadNotificationCountError<T> {
  const _$GetUnreadNotificationCountError(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'GlobalState<$T>.getUnreadNotificationCountError(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUnreadNotificationCountError<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUnreadNotificationCountErrorCopyWith<T,
          _$GetUnreadNotificationCountError<T>>
      get copyWith => __$$GetUnreadNotificationCountErrorCopyWithImpl<T,
          _$GetUnreadNotificationCountError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() getUnreadNotificationCountLoading,
    required TResult Function(UnreadNotificationCount count)
        getUnreadNotificationCountSuccess,
    required TResult Function(T data) getUnreadNotificationCountError,
  }) {
    return getUnreadNotificationCountError(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? getUnreadNotificationCountLoading,
    TResult? Function(UnreadNotificationCount count)?
        getUnreadNotificationCountSuccess,
    TResult? Function(T data)? getUnreadNotificationCountError,
  }) {
    return getUnreadNotificationCountError?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? getUnreadNotificationCountLoading,
    TResult Function(UnreadNotificationCount count)?
        getUnreadNotificationCountSuccess,
    TResult Function(T data)? getUnreadNotificationCountError,
    required TResult orElse(),
  }) {
    if (getUnreadNotificationCountError != null) {
      return getUnreadNotificationCountError(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(GetUnreadNotificationCountLoading<T> value)
        getUnreadNotificationCountLoading,
    required TResult Function(GetUnreadNotificationCountSuccess<T> value)
        getUnreadNotificationCountSuccess,
    required TResult Function(GetUnreadNotificationCountError<T> value)
        getUnreadNotificationCountError,
  }) {
    return getUnreadNotificationCountError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(GetUnreadNotificationCountLoading<T> value)?
        getUnreadNotificationCountLoading,
    TResult? Function(GetUnreadNotificationCountSuccess<T> value)?
        getUnreadNotificationCountSuccess,
    TResult? Function(GetUnreadNotificationCountError<T> value)?
        getUnreadNotificationCountError,
  }) {
    return getUnreadNotificationCountError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(GetUnreadNotificationCountLoading<T> value)?
        getUnreadNotificationCountLoading,
    TResult Function(GetUnreadNotificationCountSuccess<T> value)?
        getUnreadNotificationCountSuccess,
    TResult Function(GetUnreadNotificationCountError<T> value)?
        getUnreadNotificationCountError,
    required TResult orElse(),
  }) {
    if (getUnreadNotificationCountError != null) {
      return getUnreadNotificationCountError(this);
    }
    return orElse();
  }
}

abstract class GetUnreadNotificationCountError<T> implements GlobalState<T> {
  const factory GetUnreadNotificationCountError(final T data) =
      _$GetUnreadNotificationCountError<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$GetUnreadNotificationCountErrorCopyWith<T,
          _$GetUnreadNotificationCountError<T>>
      get copyWith => throw _privateConstructorUsedError;
}
