import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
                    EventHistoryItem(events[index], goalId),
              );
            },
            error: (error, stackTrace) => ErrWidget(error),
            loading: () => const Loading(),
          ),
    );
  }
}

class EventHistoryItem extends ConsumerWidget {
  const EventHistoryItem(this.event, this.goalId, {super.key});
  final Event event;
  final String goalId;

  @override
  Widget build(BuildContext context, ref) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(DateFormat.yMd()
              .add_jm()
              .format(event.time)), //Text(event.notes),
          InkWell(
            onTap: () => context.push('/hist/$goalId/event/${event.id}'),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '${event.duration}m',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 50),
                    child: ref.watch(eventImagesProvider(event: event)).when(
                          data: (images) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: images.length,
                                itemBuilder: (context, index) =>
                                    ImageThumbnail(bytes: images[index]),
                              ),
                            );
                          },
                          error: (error, stackTrace) => ErrWidget(error),
                          loading: () => const Loading(),
                        ),
                  ),
                ),
                Text(event.notes),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ImageThumbnail extends StatelessWidget {
  const ImageThumbnail({
    super.key,
    required this.bytes,
  });
  final Uint8List bytes;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10), child: Image.memory(bytes));
  }
}
