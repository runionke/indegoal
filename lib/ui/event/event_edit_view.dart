import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indegoal/lib.dart';
import 'package:intl/intl.dart';

class EventEditView extends ConsumerWidget {
  const EventEditView({
    super.key,
    required this.eventId,
    required this.goalId,
  });

  final String eventId;
  final String goalId;

  @override
  Widget build(BuildContext context, ref) {
    return ref.watch(eventProvider(eventId: eventId)).when(
        loading: () => const Loading(),
        error: (error, stackTrace) => ErrWidget(error),
        data: (event) => Scaffold(
            appBar: AppBar(
              title: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(DateFormat.yMd().add_jm().format(event.time),
                          style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  NoteEdit(
                    note: event.notes,
                    onSave: (note) {
                      final goal =
                          ref.watch(goalNotifierProvider).value?.withId(goalId);

                      ref
                          .watch(eventNotifierProvider(goal: goal).notifier)
                          .save(event.copyWith(notes: note));
                    },
                  ),
                  Expanded(
                    child: EventImageListView(
                      eventId: eventId,
                    ),
                  ),
                ],
              ),
            )));
  }
}

class NoteEdit extends StatefulWidget {
  const NoteEdit({super.key, required this.note, required this.onSave});
  final String note;
  final Function(String note) onSave;

  @override
  State<NoteEdit> createState() => _NoteEditState();
}

class _NoteEditState extends State<NoteEdit> {
  bool editting = false;
  late TextEditingController controller =
      TextEditingController(text: widget.note);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Notes:'),
                switch (editting) {
                  false => IconButton(
                      onPressed: () => setState(() {
                            editting = true;
                          }),
                      icon: const Icon(Icons.edit)),
                  true => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                            onPressed: () => setState(() {
                                  editting = false;
                                  controller.text = widget.note;
                                }),
                            child: const Text('Cancel')),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                editting = false;
                                widget.onSave(controller.text);
                              });
                            },
                            child: const Text('Save')),
                      ],
                    ),
                }
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: switch (editting) {
                false => Row(
                    children: [
                      Text(widget.note),
                    ],
                  ),
                true => TextField(
                    maxLines: 3,
                    controller: controller,
                  ),
              },
            )
          ],
        ),
      ),
    );
  }
}
