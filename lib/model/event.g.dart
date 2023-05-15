// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_event _$$_eventFromJson(Map<String, dynamic> json) => _$_event(
      id: json[r'$id'] as String,
      userId: json['userId'] as String,
      time: DateTime.parse(json['time'] as String),
      duration: json['duration'] as int,
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
      notes: json['notes'] as String,
    );

Map<String, dynamic> _$$_eventToJson(_$_event instance) => <String, dynamic>{
      'userId': instance.userId,
      'time': instance.time.toIso8601String(),
      'duration': instance.duration,
      'photos': instance.photos,
      'notes': instance.notes,
    };
