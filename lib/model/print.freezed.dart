// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'print.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PrintJob {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Uint8List report) complete,
    required TResult Function() standby,
    required TResult Function() running,
    required TResult Function() noData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Uint8List report)? complete,
    TResult? Function()? standby,
    TResult? Function()? running,
    TResult? Function()? noData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Uint8List report)? complete,
    TResult Function()? standby,
    TResult Function()? running,
    TResult Function()? noData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PrintJobComplete value) complete,
    required TResult Function(PrintJobStandby value) standby,
    required TResult Function(PrintJobRunning value) running,
    required TResult Function(PrintJobNoData value) noData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PrintJobComplete value)? complete,
    TResult? Function(PrintJobStandby value)? standby,
    TResult? Function(PrintJobRunning value)? running,
    TResult? Function(PrintJobNoData value)? noData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PrintJobComplete value)? complete,
    TResult Function(PrintJobStandby value)? standby,
    TResult Function(PrintJobRunning value)? running,
    TResult Function(PrintJobNoData value)? noData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrintJobCopyWith<$Res> {
  factory $PrintJobCopyWith(PrintJob value, $Res Function(PrintJob) then) =
      _$PrintJobCopyWithImpl<$Res, PrintJob>;
}

/// @nodoc
class _$PrintJobCopyWithImpl<$Res, $Val extends PrintJob>
    implements $PrintJobCopyWith<$Res> {
  _$PrintJobCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PrintJobCompleteCopyWith<$Res> {
  factory _$$PrintJobCompleteCopyWith(
          _$PrintJobComplete value, $Res Function(_$PrintJobComplete) then) =
      __$$PrintJobCompleteCopyWithImpl<$Res>;
  @useResult
  $Res call({Uint8List report});
}

/// @nodoc
class __$$PrintJobCompleteCopyWithImpl<$Res>
    extends _$PrintJobCopyWithImpl<$Res, _$PrintJobComplete>
    implements _$$PrintJobCompleteCopyWith<$Res> {
  __$$PrintJobCompleteCopyWithImpl(
      _$PrintJobComplete _value, $Res Function(_$PrintJobComplete) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? report = null,
  }) {
    return _then(_$PrintJobComplete(
      null == report
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc

class _$PrintJobComplete implements PrintJobComplete {
  const _$PrintJobComplete(this.report);

  @override
  final Uint8List report;

  @override
  String toString() {
    return 'PrintJob.complete(report: $report)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrintJobComplete &&
            const DeepCollectionEquality().equals(other.report, report));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(report));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PrintJobCompleteCopyWith<_$PrintJobComplete> get copyWith =>
      __$$PrintJobCompleteCopyWithImpl<_$PrintJobComplete>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Uint8List report) complete,
    required TResult Function() standby,
    required TResult Function() running,
    required TResult Function() noData,
  }) {
    return complete(report);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Uint8List report)? complete,
    TResult? Function()? standby,
    TResult? Function()? running,
    TResult? Function()? noData,
  }) {
    return complete?.call(report);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Uint8List report)? complete,
    TResult Function()? standby,
    TResult Function()? running,
    TResult Function()? noData,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(report);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PrintJobComplete value) complete,
    required TResult Function(PrintJobStandby value) standby,
    required TResult Function(PrintJobRunning value) running,
    required TResult Function(PrintJobNoData value) noData,
  }) {
    return complete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PrintJobComplete value)? complete,
    TResult? Function(PrintJobStandby value)? standby,
    TResult? Function(PrintJobRunning value)? running,
    TResult? Function(PrintJobNoData value)? noData,
  }) {
    return complete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PrintJobComplete value)? complete,
    TResult Function(PrintJobStandby value)? standby,
    TResult Function(PrintJobRunning value)? running,
    TResult Function(PrintJobNoData value)? noData,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(this);
    }
    return orElse();
  }
}

abstract class PrintJobComplete implements PrintJob {
  const factory PrintJobComplete(final Uint8List report) = _$PrintJobComplete;

  Uint8List get report;
  @JsonKey(ignore: true)
  _$$PrintJobCompleteCopyWith<_$PrintJobComplete> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PrintJobStandbyCopyWith<$Res> {
  factory _$$PrintJobStandbyCopyWith(
          _$PrintJobStandby value, $Res Function(_$PrintJobStandby) then) =
      __$$PrintJobStandbyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PrintJobStandbyCopyWithImpl<$Res>
    extends _$PrintJobCopyWithImpl<$Res, _$PrintJobStandby>
    implements _$$PrintJobStandbyCopyWith<$Res> {
  __$$PrintJobStandbyCopyWithImpl(
      _$PrintJobStandby _value, $Res Function(_$PrintJobStandby) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PrintJobStandby implements PrintJobStandby {
  const _$PrintJobStandby();

  @override
  String toString() {
    return 'PrintJob.standby()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PrintJobStandby);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Uint8List report) complete,
    required TResult Function() standby,
    required TResult Function() running,
    required TResult Function() noData,
  }) {
    return standby();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Uint8List report)? complete,
    TResult? Function()? standby,
    TResult? Function()? running,
    TResult? Function()? noData,
  }) {
    return standby?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Uint8List report)? complete,
    TResult Function()? standby,
    TResult Function()? running,
    TResult Function()? noData,
    required TResult orElse(),
  }) {
    if (standby != null) {
      return standby();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PrintJobComplete value) complete,
    required TResult Function(PrintJobStandby value) standby,
    required TResult Function(PrintJobRunning value) running,
    required TResult Function(PrintJobNoData value) noData,
  }) {
    return standby(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PrintJobComplete value)? complete,
    TResult? Function(PrintJobStandby value)? standby,
    TResult? Function(PrintJobRunning value)? running,
    TResult? Function(PrintJobNoData value)? noData,
  }) {
    return standby?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PrintJobComplete value)? complete,
    TResult Function(PrintJobStandby value)? standby,
    TResult Function(PrintJobRunning value)? running,
    TResult Function(PrintJobNoData value)? noData,
    required TResult orElse(),
  }) {
    if (standby != null) {
      return standby(this);
    }
    return orElse();
  }
}

abstract class PrintJobStandby implements PrintJob {
  const factory PrintJobStandby() = _$PrintJobStandby;
}

/// @nodoc
abstract class _$$PrintJobRunningCopyWith<$Res> {
  factory _$$PrintJobRunningCopyWith(
          _$PrintJobRunning value, $Res Function(_$PrintJobRunning) then) =
      __$$PrintJobRunningCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PrintJobRunningCopyWithImpl<$Res>
    extends _$PrintJobCopyWithImpl<$Res, _$PrintJobRunning>
    implements _$$PrintJobRunningCopyWith<$Res> {
  __$$PrintJobRunningCopyWithImpl(
      _$PrintJobRunning _value, $Res Function(_$PrintJobRunning) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PrintJobRunning implements PrintJobRunning {
  const _$PrintJobRunning();

  @override
  String toString() {
    return 'PrintJob.running()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PrintJobRunning);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Uint8List report) complete,
    required TResult Function() standby,
    required TResult Function() running,
    required TResult Function() noData,
  }) {
    return running();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Uint8List report)? complete,
    TResult? Function()? standby,
    TResult? Function()? running,
    TResult? Function()? noData,
  }) {
    return running?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Uint8List report)? complete,
    TResult Function()? standby,
    TResult Function()? running,
    TResult Function()? noData,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PrintJobComplete value) complete,
    required TResult Function(PrintJobStandby value) standby,
    required TResult Function(PrintJobRunning value) running,
    required TResult Function(PrintJobNoData value) noData,
  }) {
    return running(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PrintJobComplete value)? complete,
    TResult? Function(PrintJobStandby value)? standby,
    TResult? Function(PrintJobRunning value)? running,
    TResult? Function(PrintJobNoData value)? noData,
  }) {
    return running?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PrintJobComplete value)? complete,
    TResult Function(PrintJobStandby value)? standby,
    TResult Function(PrintJobRunning value)? running,
    TResult Function(PrintJobNoData value)? noData,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(this);
    }
    return orElse();
  }
}

abstract class PrintJobRunning implements PrintJob {
  const factory PrintJobRunning() = _$PrintJobRunning;
}

/// @nodoc
abstract class _$$PrintJobNoDataCopyWith<$Res> {
  factory _$$PrintJobNoDataCopyWith(
          _$PrintJobNoData value, $Res Function(_$PrintJobNoData) then) =
      __$$PrintJobNoDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PrintJobNoDataCopyWithImpl<$Res>
    extends _$PrintJobCopyWithImpl<$Res, _$PrintJobNoData>
    implements _$$PrintJobNoDataCopyWith<$Res> {
  __$$PrintJobNoDataCopyWithImpl(
      _$PrintJobNoData _value, $Res Function(_$PrintJobNoData) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PrintJobNoData implements PrintJobNoData {
  const _$PrintJobNoData();

  @override
  String toString() {
    return 'PrintJob.noData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PrintJobNoData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Uint8List report) complete,
    required TResult Function() standby,
    required TResult Function() running,
    required TResult Function() noData,
  }) {
    return noData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Uint8List report)? complete,
    TResult? Function()? standby,
    TResult? Function()? running,
    TResult? Function()? noData,
  }) {
    return noData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Uint8List report)? complete,
    TResult Function()? standby,
    TResult Function()? running,
    TResult Function()? noData,
    required TResult orElse(),
  }) {
    if (noData != null) {
      return noData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PrintJobComplete value) complete,
    required TResult Function(PrintJobStandby value) standby,
    required TResult Function(PrintJobRunning value) running,
    required TResult Function(PrintJobNoData value) noData,
  }) {
    return noData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PrintJobComplete value)? complete,
    TResult? Function(PrintJobStandby value)? standby,
    TResult? Function(PrintJobRunning value)? running,
    TResult? Function(PrintJobNoData value)? noData,
  }) {
    return noData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PrintJobComplete value)? complete,
    TResult Function(PrintJobStandby value)? standby,
    TResult Function(PrintJobRunning value)? running,
    TResult Function(PrintJobNoData value)? noData,
    required TResult orElse(),
  }) {
    if (noData != null) {
      return noData(this);
    }
    return orElse();
  }
}

abstract class PrintJobNoData implements PrintJob {
  const factory PrintJobNoData() = _$PrintJobNoData;
}
