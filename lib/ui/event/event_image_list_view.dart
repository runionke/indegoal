import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indegoal/lib.dart';

class EventImageListView extends ConsumerWidget {
  const EventImageListView({
    super.key,
    required this.goalId,
    required this.eventId,
  });

  final String goalId;
  final String eventId;

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Event Images')),
      body:
          ref.watch(eventImagesProvider(eventId: eventId, goalId: goalId)).when(
                loading: () => const Loading(),
                error: (error, stackTrace) => ErrWidget(error),
                data: (images) => Card(
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: images.map((e) => Image.memory(e)).toList(),
                  ),
                ),
              ),
    );
  }
}
