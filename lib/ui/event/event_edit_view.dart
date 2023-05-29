import 'package:flutter/material.dart';
import 'package:indegoal/lib.dart';

class EventEditView extends StatefulWidget {
  const EventEditView({
    super.key,
    required this.eventId,
  });

  final String eventId;

  @override
  State<EventEditView> createState() => _EventEditViewState();
}

class _EventEditViewState extends State<EventEditView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Event ')),
        body: EventImageListView(
          eventId: widget.eventId,
        ));
  }
}
