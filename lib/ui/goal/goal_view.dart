import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indegoal/lib.dart';
import 'package:percent_indicator/percent_indicator.dart';

class GoalView extends ConsumerWidget {
  const GoalView(this.goal, {super.key});
  final Goal goal;
  @override
  Widget build(BuildContext context, ref) {
    return Column(
      children: [
        Text('Start: ${goal.start}'),
        Text('Ends: ${goal.end.toLocal()}'),
        Text(
            'left: ${goal.end.add(const Duration(days: 2)).difference(DateTime.now()).inDays}'),
        Text(
            '${goal.end.add(const Duration(days: 2)).difference(DateTime.now()).inDays} | ${goal.end.difference(goal.start).inDays} '),
        Text(
            'Percent comp: ${(goal.end.add(const Duration(days: 2)).difference(DateTime.now()).inDays / goal.end.difference(goal.start).inDays)}'),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: LinearPercentIndicator(
                center: Text(
                    '${goal.end.add(const Duration(days: 2)).difference(DateTime.now()).inDays} day(s) left.'),
                width: 140.0,
                lineHeight: 24.0,
                percent: goal.end
                        .add(const Duration(days: 2))
                        .difference(DateTime.now())
                        .inDays /
                    goal.end.difference(goal.start).inDays,
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
                barRadius: const Radius.circular(9),
              ),
            ),
            ref.watch(eventNotifierProvider(goal: goal)).when(
                data: (data) {
                  Log.d('GoalView: total events: ${data.length}');
                  final minutes = data.minutes;
                  Log.d(
                      'AAAAA G: ${goal.minutes}  Minutes: $minutes  : ${(minutes / goal.minutes)}');
                  return LinearPercentIndicator(
                    center: Text('$minutes / ${goal.minutes} minutes'),
                    width: 140.0,
                    lineHeight: 24.0,
                    percent: (minutes / goal.minutes),
                    backgroundColor: Colors.grey,
                    progressColor: Colors.green,
                    barRadius: const Radius.circular(9),
                  );
                },
                error: (error, stackTrace) => ErrWidget(error),
                loading: () => const Loading())
          ],
        ),
      ],
    );
  }
}
