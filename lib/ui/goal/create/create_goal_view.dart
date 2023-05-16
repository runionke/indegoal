import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:indegoal/lib.dart';
import 'package:numberpicker/numberpicker.dart';

class CreateGoalView extends StatelessWidget {
  const CreateGoalView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CreateGoal(),
    );
  }
}

class CreateGoal extends ConsumerStatefulWidget {
  const CreateGoal({super.key});

  @override
  ConsumerState<CreateGoal> createState() => _CreateGoalState();
}

class _CreateGoalState extends ConsumerState<CreateGoal> {
  Goal goal = Goal.empty();
  int index = 0;
  final lengthController = StreamController<int>.broadcast();
  final minutesController = StreamController<int>.broadcast();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (index == 0)
            GoalInput<int>(
                input: (value) => NumberPicker(
                      value: value,
                      minValue: 1,
                      maxValue: 100,
                      onChanged: lengthController.sink.add,
                    ),
                label:
                    const Text('Select the number of days to reach your goal.'),
                initialValue: 7,
                onCancel: () => setState(() => index--),
                onSave: (len) => setState(() {
                      goal = goal.copyWith(period: len);
                      index++;
                    }),
                controller: lengthController),
          if (index == 1)
            GoalStart(
                onCancel: () => setState(() => index--),
                onSave: (date) {
                  index++;
                  setState(() => goal = goal.copyWith(start: date));
                }),
          if (index == 2)
            GoalInput<int>(
                input: (value) => NumberPicker(
                      value: value,
                      minValue: 1,
                      maxValue: 9999,
                      onChanged: minutesController.sink.add,
                    ),
                label: const Text('Goal Minutes'),
                saveDisplay: const Text('Done'),
                initialValue: 60,
                onCancel: () => setState(() => index--),
                onSave: (val) async {
                  ref
                      .watch(goalNotifierProvider.notifier)
                      .create(goal.copyWith(minutes: val));

                  context.go('/');
                },
                controller: minutesController),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    lengthController.close();
    minutesController.close();
  }
}
