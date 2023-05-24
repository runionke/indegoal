import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:indegoal/lib.dart';
import 'package:numberpicker/numberpicker.dart';

class CreateEventView extends ConsumerStatefulWidget {
  const CreateEventView({super.key, this.goalId});
  final String? goalId;
  @override
  ConsumerState<CreateEventView> createState() => _CreateEventViewState();
}

class _CreateEventViewState extends ConsumerState<CreateEventView> {
  Event event = Event.empty();

  @override
  Widget build(BuildContext context) {
    return SleeveOfWizard(
        child: Wizard(
      onComplete: () async {
        await ref.watch(eventNotifierProvider().notifier).create(event);
        if (context.mounted) {
          context.go('/');
        }
      },
      steps: [
        WizardStep(
          builder: (_) {
            return Column(
              children: [
                const Flexible(child: Text('When?')),
                const SizedBox(
                  height: 20.0,
                ),
                DateButton(
                  onSave: (value) =>
                      setState(() => event = event.copyWith(time: value)),
                ),
              ],
            );
          },
        ),
        WizardStep(
          builder: (_) {
            return Column(
              children: [
                const Flexible(child: Text('How many minutes?')),
                const SizedBox(
                  height: 20.0,
                ),
                NumberPicker(
                  value: event.duration,
                  minValue: 1,
                  maxValue: 100,
                  onChanged: (value) =>
                      setState(() => event = event.copyWith(duration: value)),
                ),
              ],
            );
          },
        ),
        WizardStep(
          builder: (_) {
            return Column(
              children: [
                const Flexible(child: Text('Notes:')),
                const SizedBox(
                  height: 20.0,
                ),
                TextFieldContainer(
                  builder: (controller) => TextField(
                    controller: controller,
                    maxLines: 4,
                    onChanged: (value) =>
                        setState(() => event = event.copyWith(notes: value)),
                  ),
                ),
              ],
            );
          },
        ),
      ],
      builder: (context, step, previous, next, index) {
        return Editor(
          cancelDisplay: index == 0 ? const Text('Cancel') : const Text('Back'),
          saveDisplay: index == 2 ? const Text('Save') : const Text('Next'),
          onCancel: previous,
          onSave: next,
          child: step,
        );
      },
    ));
  }
}
