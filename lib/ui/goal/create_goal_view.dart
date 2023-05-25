import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:indegoal/lib.dart';
import 'package:numberpicker/numberpicker.dart';

class CreateGoalView extends ConsumerStatefulWidget {
  const CreateGoalView({super.key});

  @override
  ConsumerState<CreateGoalView> createState() => _CreateGoalViewState();
}

class _CreateGoalViewState extends ConsumerState<CreateGoalView> {
  Goal goal = Goal.empty().copyWith(period: 1, minutes: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Set a Goal')),
      body: SleeveOfWizard(
          child: Wizard(
        onCancel: () => context.go('/'),
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
          ),
          WizardStep(
            builder: (_) {
              return Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(28.0),
                    child: Text('Start Today or an alternate time?'),
                  ),
                  DateButton(
                    onSave: (value) =>
                        setState(() => goal = goal.copyWith(start: value)),
                  ),
                ],
              );
            },
          ),
          WizardStep(
            builder: (_) {
              return Column(
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
      )),
    );
  }
}
