import 'dart:async';

import 'package:flutter/material.dart';
import 'package:indegoal/lib.dart';
import 'package:indegoal/ui/goal/create/goal_input.dart';
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

class CreateGoal extends StatefulWidget {
  const CreateGoal({super.key});

  @override
  State<CreateGoal> createState() => _CreateGoalState();
}

class _CreateGoalState extends State<CreateGoal> {
  Goal goal = Goal.empty();
  int index = 0;
  final lengthController = StreamController<int>();
  final minutesController = StreamController<int>();

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
                      minValue: 0,
                      maxValue: 100,
                      onChanged: lengthController.sink.add,
                    ),
                label:
                    const Text('Select the number of days to reach your goal.'),
                initialValue: 0,
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
                  setState(() => goal = goal.copyWith(start: date));
                }),
          if (index == 2)
            GoalInput<int>(
                input: (value) => NumberPicker(
                      value: value,
                      minValue: 0,
                      maxValue: 100,
                      onChanged: minutesController.sink.add,
                    ),
                label: const Text('Goal Minutes'),
                initialValue: 0,
                onCancel: () => setState(() => index--),
                onSave: (len) => setState(() {
                      goal = goal.copyWith(period: len);
                      index++;
                    }),
                controller: minutesController),
        ],
      ),
    );
  }
}
