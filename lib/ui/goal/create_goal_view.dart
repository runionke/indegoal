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
  Goal goal = Goal.empty().copyWith(period: 7, minutes: 90);
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
        outtrow: () => const Loading.shimmer(),
        steps: [
          WizardStep(
            builder: (_) {
              return Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Select the number of days to reach your goal.',
                      textScaleFactor: 2,
                    ),
                  ),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) => NumberPicker(
                        value: goal.period,
                        minValue: 1,
                        maxValue: 365,
                        itemHeight: constraints.maxHeight / 2,
                        selectedTextStyle: const TextStyle(fontSize: 40),
                        onChanged: (value) =>
                            setState(() => goal = goal.copyWith(period: value)),
                      ),
                    ),
                  ),
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
                    child: Text(
                      'Start Today or an alternate time?',
                      textScaleFactor: 2.2,
                    ),
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
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Time in minutes to reach goal.',
                      textScaleFactor: 2.3,
                    ),
                  ),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) => NumberPicker(
                        value: goal.minutes,
                        minValue: 1,
                        maxValue: 300,
                        itemHeight: constraints.maxHeight / 2,
                        selectedTextStyle: const TextStyle(fontSize: 40),
                        onChanged: (value) => setState(
                            () => goal = goal.copyWith(minutes: value)),
                      ),
                    ),
                  ),
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
