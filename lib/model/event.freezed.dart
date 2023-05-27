// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Event _$EventFromJson(Map<String, dynamic> json) {
  return _event.fromJson(json);
}

/// @nodoc
mixin _$Event {
  @JsonKey(includeToJson: false, includeFromJson: true, name: '\$id')
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get time => throw _privateConstructorUsedError;

  ///in minutes
  int get duration => throw _privateConstructorUsedError;

  ///storage Ids of photos
  List<String> get photos => throw _privateConstructorUsedError;

  ///user entry text
  String get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res, Event>;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false, includeFromJson: true, name: '\$id')
          String id,
      String userId,
      DateTime time,
      int duration,
      List<String> photos,
      String notes});
}

/// @nodoc
class _$EventCopyWithImpl<$Res, $Val extends Event>
    implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? time = null,
    Object? duration = null,
    Object? photos = null,
    Object? notes = null,
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
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_eventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$$_eventCopyWith(_$_event value, $Res Function(_$_event) then) =
      __$$_eventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false, includeFromJson: true, name: '\$id')
          String id,
      String userId,
      DateTime time,
      int duration,
      List<String> photos,
      String notes});
}

/// @nodoc
class __$$_eventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res, _$_event>
    implements _$$_eventCopyWith<$Res> {
  __$$_eventCopyWithImpl(_$_event _value, $Res Function(_$_event) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? time = null,
    Object? duration = null,
    Object? photos = null,
    Object? notes = null,
  }) {
    return _then(_$_event(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      photos: null == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_event with DiagnosticableTreeMixin implements _event {
  const _$_event(
      {@JsonKey(includeToJson: false, includeFromJson: true, name: '\$id')
          required this.id,
      required this.userId,
      required this.time,
      required this.duration,
      required final List<String> photos,
      required this.notes})
      : _photos = photos;

  factory _$_event.fromJson(Map<String, dynamic> json) =>
      _$$_eventFromJson(json);

  @override
  @JsonKey(includeToJson: false, includeFromJson: true, name: '\$id')
  final String id;
  @override
  final String userId;
  @override
  final DateTime time;

  ///in minutes
  @override
  final int duration;

  ///storage Ids of photos
  final List<String> _photos;

  ///storage Ids of photos
  @override
  List<String> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  ///user entry text
  @override
  final String notes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Event(id: $id, userId: $userId, time: $time, duration: $duration, photos: $photos, notes: $notes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Event'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('time', time))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('photos', photos))
      ..add(DiagnosticsProperty('notes', notes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_event &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, time, duration,
      const DeepCollectionEquality().hash(_photos), notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_eventCopyWith<_$_event> get copyWith =>
      __$$_eventCopyWithImpl<_$_event>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_eventToJson(
      this,
    );
  }
}

abstract class _event implements Event {
  const factory _event(
      {@JsonKey(includeToJson: false, includeFromJson: true, name: '\$id')
          required final String id,
      required final String userId,
      required final DateTime time,
      required final int duration,
      required final List<String> photos,
      required final String notes}) = _$_event;

  factory _event.fromJson(Map<String, dynamic> json) = _$_event.fromJson;

  @override
  @JsonKey(includeToJson: false, includeFromJson: true, name: '\$id')
  String get id;
  @override
  String get userId;
  @override
  DateTime get time;
  @override

  ///in minutes
  int get duration;
  @override

  ///storage Ids of photos
  List<String> get photos;
  @override

  ///user entry text
  String get notes;
  @override
  @JsonKey(ignore: true)
  _$$_eventCopyWith<_$_event> get copyWith =>
      throw _privateConstructorUsedError;
}
