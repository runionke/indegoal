import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indegoal/lib.dart';
import 'package:intl/intl.dart';

class EventEditView extends ConsumerStatefulWidget {
  const EventEditView({
    super.key,
    required this.eventId,
  });

  final String eventId;

  @override
  ConsumerState<EventEditView> createState() => _EventEditViewState();
}

class _EventEditViewState extends ConsumerState<EventEditView> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(eventProvider(eventId: widget.eventId)).when(
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
                  Expanded(
                    child: EventImageListView(
                      eventId: widget.eventId,
                    ),
                  ),
                ],
              ),
            )));
  }
}
