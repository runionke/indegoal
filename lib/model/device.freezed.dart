// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeviceType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() small,
    required TResult Function() large,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? small,
    TResult? Function()? large,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? small,
    TResult Function()? large,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SmallDevice value) small,
    required TResult Function(LargeDevice value) large,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SmallDevice value)? small,
    TResult? Function(LargeDevice value)? large,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SmallDevice value)? small,
    TResult Function(LargeDevice value)? large,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceTypeCopyWith<$Res> {
  factory $DeviceTypeCopyWith(
          DeviceType value, $Res Function(DeviceType) then) =
      _$DeviceTypeCopyWithImpl<$Res, DeviceType>;
}

/// @nodoc
class _$DeviceTypeCopyWithImpl<$Res, $Val extends DeviceType>
    implements $DeviceTypeCopyWith<$Res> {
  _$DeviceTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SmallDeviceCopyWith<$Res> {
  factory _$$SmallDeviceCopyWith(
          _$SmallDevice value, $Res Function(_$SmallDevice) then) =
      __$$SmallDeviceCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SmallDeviceCopyWithImpl<$Res>
    extends _$DeviceTypeCopyWithImpl<$Res, _$SmallDevice>
    implements _$$SmallDeviceCopyWith<$Res> {
  __$$SmallDeviceCopyWithImpl(
      _$SmallDevice _value, $Res Function(_$SmallDevice) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SmallDevice implements SmallDevice {
  const _$SmallDevice();

  @override
  String toString() {
    return 'DeviceType.small()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SmallDevice);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() small,
    required TResult Function() large,
  }) {
    return small();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? small,
    TResult? Function()? large,
  }) {
    return small?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? small,
    TResult Function()? large,
    required TResult orElse(),
  }) {
    if (small != null) {
      return small();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SmallDevice value) small,
    required TResult Function(LargeDevice value) large,
  }) {
    return small(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SmallDevice value)? small,
    TResult? Function(LargeDevice value)? large,
  }) {
    return small?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SmallDevice value)? small,
    TResult Function(LargeDevice value)? large,
    required TResult orElse(),
  }) {
    if (small != null) {
      return small(this);
    }
    return orElse();
  }
}

abstract class SmallDevice implements DeviceType {
  const factory SmallDevice() = _$SmallDevice;
}

/// @nodoc
abstract class _$$LargeDeviceCopyWith<$Res> {
  factory _$$LargeDeviceCopyWith(
          _$LargeDevice value, $Res Function(_$LargeDevice) then) =
      __$$LargeDeviceCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LargeDeviceCopyWithImpl<$Res>
    extends _$DeviceTypeCopyWithImpl<$Res, _$LargeDevice>
    implements _$$LargeDeviceCopyWith<$Res> {
  __$$LargeDeviceCopyWithImpl(
      _$LargeDevice _value, $Res Function(_$LargeDevice) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LargeDevice implements LargeDevice {
  const _$LargeDevice();

  @override
  String toString() {
    return 'DeviceType.large()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LargeDevice);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() small,
    required TResult Function() large,
  }) {
    return large();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? small,
    TResult? Function()? large,
  }) {
    return large?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? small,
    TResult Function()? large,
    required TResult orElse(),
  }) {
    if (large != null) {
      return large();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SmallDevice value) small,
    required TResult Function(LargeDevice value) large,
  }) {
    return large(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SmallDevice value)? small,
    TResult? Function(LargeDevice value)? large,
  }) {
    return large?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SmallDevice value)? small,
    TResult Function(LargeDevice value)? large,
    required TResult orElse(),
  }) {
    if (large != null) {
      return large(this);
    }
    return orElse();
  }
}

abstract class LargeDevice implements DeviceType {
  const factory LargeDevice() = _$LargeDevice;
}
