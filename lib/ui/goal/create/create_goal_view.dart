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
  Goal goal = Goal.empty().copyWith(period: 1, minutes: 1);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wizard(
          onComplete: () async {
            await ref.watch(goalNotifierProvider.notifier).create(goal);
            if (context.mounted) {
              context.go('/');
            }
          },
          steps: [
            WizardStep(
              builder: (_) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    NumberPicker(
                      value: goal.period,
                      minValue: 1,
                      maxValue: 100,
                      onChanged: (value) =>
                          setState(() => goal = goal.copyWith(period: value)),
                    ),
                    const Text('Select the number of days to reach your goal.'),
                  ],
                );
              },
              update: <Goal>() => true,
            ),
            WizardStep(
                builder: (_) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Flexible(
                          child: Text('Start Today or an alternate time?')),
                      const SizedBox(
                        height: 20.0,
                      ),
                      DateButton(
                        onSave: (value) =>
                            setState(() => goal = goal.copyWith(start: value)),
                      ),
                    ],
                  );
                },
                update: <Goal>() => true),
            WizardStep(
              builder: (_) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    NumberPicker(
                      value: goal.minutes,
                      minValue: 1,
                      maxValue: 100,
                      onChanged: (value) =>
                          setState(() => goal = goal.copyWith(minutes: value)),
                    ),
                    const Text('Time in minutes to reach goal.'),
                  ],
                );
              },
              update: <Goal>() => true,
            ),
          ],
          builder: (context, step, previous, next, index) {
            return Editor(
              cancelDisplay:
                  index == 0 ? const Text('Cancel') : const Text('Back'),
              saveDisplay: index == 2 ? const Text('Save') : const Text('Next'),
              onCancel: previous,
              onSave: next,
              child: step,
            );
          },
        ));
  }
}
