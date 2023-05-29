import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indegoal/lib.dart';
import 'package:shimmer/shimmer.dart';

class EventImageListView extends ConsumerWidget {
  const EventImageListView({
    super.key,
    required this.eventId,
  });

  final String eventId;

  @override
  Widget build(BuildContext context, ref) {
    return ref
        .watch(eventImagesProvider(eventId: eventId, width: 200, height: 200))
        .when(
          loading: () => Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: const Card(child: SizedBox.expand()),
          ),
          error: (error, stackTrace) => ErrWidget(error),
          data: (images) => Card(
            child: GridView.count(
              crossAxisCount: 2,
              children: images
                  .map((e) => ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.memory(e)))
                  .toList(),
            ),
          ),
        );
  }
}
