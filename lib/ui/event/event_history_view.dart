import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indegoal/lib.dart';
import 'package:intl/intl.dart';

class EventHistoryView extends ConsumerWidget {
  const EventHistoryView({super.key, required this.goalId});
  final String goalId;

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('History')),
      body: ref
          .watch(eventNotifierProvider(
              goal:
                  ref.watch(goalNotifierProvider).valueOrNull?.withId(goalId)))
          .when(
            data: (data) {
              final events = data.sortByTime.toList();
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) =>
                    EventHistoryItem(events[index]),
              );
            },
            error: (error, stackTrace) => ErrWidget(error),
            loading: () => const Loading(),
          ),
    );
  }
}

class EventHistoryItem extends StatelessWidget {
  const EventHistoryItem(this.event, {super.key});
  final Event event;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(DateFormat.yMd().add_jm().format(event.time)),
      subtitle: Text(event.notes),
    );
  }
}
