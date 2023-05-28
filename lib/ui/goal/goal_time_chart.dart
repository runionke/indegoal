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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ref.watch(eventNotifierProvider(goal: goal)).when(
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
                    id: 'Events',
                    color: Colors.blue,
                    data: events.groupTotaled
                        .map((e) =>
                            DChartTimeData(time: e.time, value: e.duration))
                        .toList(),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
