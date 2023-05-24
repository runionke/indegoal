// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Goal _$GoalFromJson(Map<String, dynamic> json) {
  return _goal.fromJson(json);
}

/// @nodoc
mixin _$Goal {
  @JsonKey(includeToJson: false, includeFromJson: true, name: '\$id')
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;

  ///amount to complete goal
  int get minutes => throw _privateConstructorUsedError;

  ///days in goal period
  int get period => throw _privateConstructorUsedError;

  ///when begins
  DateTime get start => throw _privateConstructorUsedError;

  ///or one time
  bool get recurring => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GoalCopyWith<Goal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalCopyWith<$Res> {
  factory $GoalCopyWith(Goal value, $Res Function(Goal) then) =
      _$GoalCopyWithImpl<$Res, Goal>;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false, includeFromJson: true, name: '\$id')
          String id,
      String userId,
      int minutes,
      int period,
      DateTime start,
      bool recurring});
}

/// @nodoc
class _$GoalCopyWithImpl<$Res, $Val extends Goal>
    implements $GoalCopyWith<$Res> {
  _$GoalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? minutes = null,
    Object? period = null,
    Object? start = null,
    Object? recurring = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      minutes: null == minutes
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      recurring: null == recurring
          ? _value.recurring
          : recurring // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_goalCopyWith<$Res> implements $GoalCopyWith<$Res> {
  factory _$$_goalCopyWith(_$_goal value, $Res Function(_$_goal) then) =
      __$$_goalCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false, includeFromJson: true, name: '\$id')
          String id,
      String userId,
      int minutes,
      int period,
      DateTime start,
      bool recurring});
}

/// @nodoc
class __$$_goalCopyWithImpl<$Res> extends _$GoalCopyWithImpl<$Res, _$_goal>
    implements _$$_goalCopyWith<$Res> {
  __$$_goalCopyWithImpl(_$_goal _value, $Res Function(_$_goal) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? minutes = null,
    Object? period = null,
    Object? start = null,
    Object? recurring = null,
  }) {
    return _then(_$_goal(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      minutes: null == minutes
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      recurring: null == recurring
          ? _value.recurring
          : recurring // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_goal extends _goal {
  const _$_goal(
      {@JsonKey(includeToJson: false, includeFromJson: true, name: '\$id')
          required this.id,
      required this.userId,
      required this.minutes,
      required this.period,
      required this.start,
      required this.recurring})
      : super._();

  factory _$_goal.fromJson(Map<String, dynamic> json) => _$$_goalFromJson(json);

  @override
  @JsonKey(includeToJson: false, includeFromJson: true, name: '\$id')
  final String id;
  @override
  final String userId;

  ///amount to complete goal
  @override
  final int minutes;

  ///days in goal period
  @override
  final int period;

  ///when begins
  @override
  final DateTime start;

  ///or one time
  @override
  final bool recurring;

  @override
  String toString() {
    return 'Goal(id: $id, userId: $userId, minutes: $minutes, period: $period, start: $start, recurring: $recurring)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_goal &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.minutes, minutes) || other.minutes == minutes) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.recurring, recurring) ||
                other.recurring == recurring));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, minutes, period, start, recurring);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_goalCopyWith<_$_goal> get copyWith =>
      __$$_goalCopyWithImpl<_$_goal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_goalToJson(
      this,
    );
  }
}

abstract class _goal extends Goal {
  const factory _goal(
      {@JsonKey(includeToJson: false, includeFromJson: true, name: '\$id')
          required final String id,
      required final String userId,
      required final int minutes,
      required final int period,
      required final DateTime start,
      required final bool recurring}) = _$_goal;
  const _goal._() : super._();

  factory _goal.fromJson(Map<String, dynamic> json) = _$_goal.fromJson;

  @override
  @JsonKey(includeToJson: false, includeFromJson: true, name: '\$id')
  String get id;
  @override
  String get userId;
  @override

  ///amount to complete goal
  int get minutes;
  @override

  ///days in goal period
  int get period;
  @override

  ///when begins
  DateTime get start;
  @override

  ///or one time
  bool get recurring;
  @override
  @JsonKey(ignore: true)
  _$$_goalCopyWith<_$_goal> get copyWith => throw _privateConstructorUsedError;
}
