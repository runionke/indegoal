import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indegoal/lib.dart';
import 'package:intl/intl.dart';

class GoalTimeChart extends ConsumerWidget {
  const GoalTimeChart(this.goal, {super.key});
  final Goal goal;
  @override
  Widget build(BuildContext context, ref) {
    return ref.watch(eventNotifierProvider(goal: goal)).when(
          loading: () => const Loading(),
          error: (error, stackTrace) => ErrWidget(error),
          data: (events) => DChartTime(
            chartRender: DRenderBar(),
            measureLabel: (value) => '$value',
            domainLabel: (dateTime) {
              // [DateFormat] from intl package
              return DateFormat('d ').format(dateTime!);
            },
            groupData: [
              DChartTimeGroup(
                id: 'Keyboard',
                color: Colors.blue,
                data: events.groupTotaled.map((e) {
                  Log.d('DateTime: ${e.time} : ${e.duration}');
                  return DChartTimeData(time: e.time, value: e.duration);
                }).toList(),
              ),
            ],
          ),
        );
  }
}
