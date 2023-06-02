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
    return ref
        .watch(eventImagesProvider(eventId: eventId, width: 200, height: 200))
        .when(
          loading: () => const Loading.shimmer(),
          error: (error, stackTrace) => ErrWidget(error),
          data: (images) => Card(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10, crossAxisSpacing: 10, crossAxisCount: 2),
              itemCount: images.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Stack(
                      children: [
                        ImageThumbnail(
                          width: double.infinity,
                          height: double.infinity,
                          bytes: images[index],
                        ),
                        Positioned(
                          top: 1,
                          right: 1,
                          child: PopupMenuButton<Function>(
                            onSelected: (value) {
                              value();
                            },
                            icon: const Icon(Icons.more_vert),
                            itemBuilder: (context) =>
                                <PopupMenuEntry<Function>>[
                              PopupMenuItem(
                                value: () => ref
                                    .watch(eventNotifierProvider().notifier)
                                    .removeImage(eventId, index),
                                child: const Text('Delete'),
                              ),
                            ],
                          ),
                        )
                      ],
                    ));
              },
            ),
          ),
        );
  }
}
