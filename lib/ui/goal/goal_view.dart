import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indegoal/lib.dart';
import 'package:indegoal/ui/goal/goal_time_chart.dart';

class GoalView extends ConsumerWidget {
  const GoalView(this.goal, {super.key});
  final Goal goal;
  @override
  Widget build(BuildContext context, ref) {
    return Column(
      children: [
        Text('Start: ${goal.start}'),
        Text('Ends: ${goal.end.toLocal()}'),
        Text('left: ${goal.daysLeft}'),
        Text('goal: ${goal.minutes}'),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 100,
              height: 20,
              child: DChartSingleBar(
                forgroundLabel: Text('${(goal.period - goal.daysLeft)}'),
                backgroundLabel: Text(goal.period.toString()),
                backgroundColor: Colors.grey,
                forgroundColor: Colors.blue,
                value: (goal.period - goal.daysLeft).toDouble(),
                max: goal.period.toDouble(),
                radius: const BorderRadius.all(Radius.circular(8)),
              ),
            ),
            ref.watch(eventNotifierProvider(goal: goal)).when(
                data: (data) {
                  Log.d('GoalView: total events: ${data.length}');
                  final minutes = data.minutes;
                  Log.d(
                      'AAAAA G: ${goal.minutes}  Minutes: $minutes  : ${(minutes / goal.minutes)}');

                  return SizedBox(
                    width: 100,
                    height: 20,
                    child: DChartSingleBar(
                      forgroundLabel: Text(minutes.toString()),
                      backgroundLabel: Text(goal.minutes.toString()),
                      backgroundColor: Colors.grey,
                      forgroundColor: Colors.blue,
                      value: minutes.toDouble(),
                      max: goal.minutes.toDouble(),
                      radius: const BorderRadius.all(Radius.circular(8)),
                    ),
                  );
                },
                error: (error, stackTrace) => ErrWidget(error),
                loading: () => const Loading()),
          ],
        ),
        SizedBox(width: 200, height: 200, child: GoalTimeChart(goal)),
      ],
    );
  }
}
