import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal.freezed.dart';
part 'goal.g.dart';

@freezed
class Goal with _$Goal {
  const factory Goal({
    @JsonKey(includeToJson: false, includeFromJson: true, name: '\$id')
        required String id,
    required String userId,

    ///amount to complete goal
    required int minutes,

    ///days in goal period
    required int period,

    ///when begins
    required DateTime start,

    ///or one time
    required bool recurring,
  }) = _goal;

  factory Goal.fromJson(Map<String, Object?> json) => _$GoalFromJson(json);
  factory Goal.empty() => Goal(
        id: '',
        minutes: 0,
        period: 0,
        recurring: false,
        start: DateTime.now(),
        userId: '',
      );
}
