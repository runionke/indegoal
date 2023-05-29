import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indegoal/lib.dart';

class EventImageListView extends ConsumerWidget {
  const EventImageListView({
    super.key,
    required this.eventId,
  });

  final String eventId;

  @override
  Widget build(BuildContext context, ref) {
    return ref.watch(eventImagesProvider(eventId: eventId)).when(
          loading: () => const Loading(),
          error: (error, stackTrace) => ErrWidget(error),
          data: (images) => Card(
            child: GridView.count(
              crossAxisCount: 2,
              children: images.map((e) => Image.memory(e)).toList(),
            ),
          ),
        );
  }
}
