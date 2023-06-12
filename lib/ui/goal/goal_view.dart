import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indegoal/lib.dart';
import 'package:intl/intl.dart';

const topConstraints = BoxConstraints(maxWidth: 400, maxHeight: 200);
const chartConstraints = BoxConstraints(maxWidth: 400, maxHeight: 300);

class GoalView extends ConsumerWidget {
  const GoalView(this.goal, {super.key});
  final Goal goal;
  @override
  Widget build(BuildContext context, ref) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: ConstrainedBox(
            constraints: topConstraints,
            child: Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Flex(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      direction: switch (Device.of(context).device) {
                        SmallDevice() => Axis.vertical,
                        LargeDevice() => Axis.horizontal,
                      },
                      children: [
                        Text(
                            'Started on ${DateFormat("EEE, MMM d, ''yy").format(goal.start)}'),
                        Text(
                            'Ending on:  ${DateFormat("EEE, MMM d, ''yy").format(goal.end)}'),
                      ],
                    ),
                  ),
                  ProgressWidget(
                    title: 'Days Left',
                    foreLabel: '${(goal.period - goal.daysLeft)}',
                    backLabel: goal.period.toString(),
                    value: (goal.period - goal.daysLeft).toDouble(),
                    max: goal.period.toDouble(),
                  ),
                  ref.watch(eventNotifierProvider(goal: goal)).when(
                      data: (data) {
                        Log.d('GoalView: total events: ${data.length}');
                        final minutes = data.minutes;
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ProgressWidget(
                              title: 'Minutes Completed',
                              foreLabel: minutes.toString(),
                              backLabel: goal.minutes.toString(),
                              value: minutes.toDouble(),
                              max: goal.minutes.toDouble(),
                            ),
                            if (minutes >= goal.minutes)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        'You\'ve completed your goal of ${goal.minutes} minutes!'),
                                    const Icon(Icons.assist_walker_sharp)
                                  ],
                                ),
                              )
                          ],
                        );
                      },
                      error: ErrWidget.new,
                      loading: Loading.new),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: ConstrainedBox(
              constraints: chartConstraints, child: GoalTimeChart(goal)),
        ),
      ],
    );
  }
}
