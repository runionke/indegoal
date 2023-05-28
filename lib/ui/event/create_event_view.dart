import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:indegoal/lib.dart';
import 'package:numberpicker/numberpicker.dart';

class CreateEventView extends ConsumerStatefulWidget {
  const CreateEventView({super.key, required this.goalId});
  final String goalId;
  @override
  ConsumerState<CreateEventView> createState() => _CreateEventViewState();
}

class _CreateEventViewState extends ConsumerState<CreateEventView> {
  Event event = Event.empty();
  List<Uint8List>? eventImages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Event')),
      body: SleeveOfWizard(
          child: Wizard(
        onCancel: () => context.go('/'),
        onComplete: () async {
          //must pass the correct parameter goal, to invalidate and rebuild same provider
          await ref
              .watch(eventNotifierProvider(
                goal: ref
                    .watch(goalNotifierProvider)
                    .valueOrNull
                    ?.withId(widget.goalId),
              ).notifier)
              .create(event, images: eventImages);
          if (context.mounted) {
            context.go('/');
          }
        },
        steps: [
          WizardStep(
            builder: (_) {
              return Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Text('When?'),
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
                //mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Text('How many minutes?'),
                  ),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) => NumberPicker(
                        value: event.duration,
                        minValue: 1,
                        maxValue: 100,
                        itemHeight: constraints.maxHeight / 4,
                        onChanged: (value) => setState(
                            () => event = event.copyWith(duration: value)),
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
                    padding: EdgeInsets.only(bottom: 2.0),
                    child: Text('Notes:'),
                  ),
                  TextFieldContainer(
                    builder: (controller) => TextField(
                      controller: controller,
                      maxLines: 4,
                      onChanged: (value) =>
                          setState(() => event = event.copyWith(notes: value)),
                    ),
                  ),
                  EventImagePicker(onPick: (images) => eventImages = images),
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
