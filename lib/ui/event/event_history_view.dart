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

class EventHistoryItem extends ConsumerWidget {
  const EventHistoryItem(this.event, {super.key});
  final Event event;

  @override
  Widget build(BuildContext context, ref) {
    return ListTile(
      leading: Text(DateFormat.yMd().add_jm().format(event.time)),
      title: Row(
        children: [
          Text('Minutes: ${event.duration}'),
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 50),
              child: ref.watch(eventImagesProvider(event)).when(
                    data: (images) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: images.length,
                        itemBuilder: (context, index) =>
                            Image.memory(images[index]),
                      );
                    },
                    error: (error, stackTrace) => ErrWidget(error),
                    loading: () => const Loading(),
                  ),
            ),
          )
        ],
      ),
      subtitle: Text(event.notes),
    );
  }
}
