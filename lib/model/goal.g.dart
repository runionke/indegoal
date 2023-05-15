// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_goal _$$_goalFromJson(Map<String, dynamic> json) => _$_goal(
      id: json[r'$id'] as String,
      userId: json['userId'] as String,
      minutes: json['minutes'] as int,
      period: json['period'] as int,
      start: DateTime.parse(json['start'] as String),
      recurring: json['recurring'] as bool,
    );

Map<String, dynamic> _$$_goalToJson(_$_goal instance) => <String, dynamic>{
      'userId': instance.userId,
      'minutes': instance.minutes,
      'period': instance.period,
      'start': instance.start.toIso8601String(),
      'recurring': instance.recurring,
    };
