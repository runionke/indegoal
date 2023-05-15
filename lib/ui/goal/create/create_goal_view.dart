import 'package:flutter/material.dart';
import 'package:indegoal/lib.dart';

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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (index == 0)
            GoalLength(
                onCancel: () => setState(() => index--),
                onSave: (len) => setState(() {
                      goal = goal.copyWith(period: len);
                      index++;
                    })),
          if (index == 1)
            GoalStart(
                onCancel: () => setState(() => index--),
                onSave: (date) {
                  setState(() => goal = goal.copyWith(start: date));
                }),
        ],
      ),
    );
  }
}
