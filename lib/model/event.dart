import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
  const factory Event({
    @JsonKey(includeToJson: false, includeFromJson: true, name: '\$id')
    required String id,
    required String userId,
    required DateTime time,

    ///in minutes
    required int duration,

    ///storage Ids of photos
    required List<String> photos,

    ///user entry text
    required String notes,
  }) = _event;

  factory Event.fromJson(Map<String, Object?> json) => _$EventFromJson(json);
  factory Event.empty() => Event(
        id: '',
        notes: '',
        duration: 1,
        photos: [],
        time: DateTime.now(),
        userId: '',
      );
}
