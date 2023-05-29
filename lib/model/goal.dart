import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal.freezed.dart';
part 'goal.g.dart';

@freezed
class Goal with _$Goal {
  const Goal._();
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
    @JsonKey(defaultValue: true) required bool active,
  }) = _goal;

  DateTime get end => start.add(Duration(days: period));

  factory Goal.fromJson(Map<String, Object?> json) => _$GoalFromJson(json);
  factory Goal.empty() => Goal(
        id: '',
        minutes: 90,
        period: 7,
        recurring: false,
        start: DateTime.now(),
        userId: '',
        active: true,
      );
}

extension GoalExtention on Goal {
  int get daysLeft => DateTime.now().difference(start).inDays + 1;
}
