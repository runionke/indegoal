import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indegoal/lib.dart';
//I'm implementing this on web. If you build for another platform the download
//functionality is just going to add a log message
import 'package:indegoal/util/download/download_not.dart'
    if (dart.library.html) 'package:indegoal/util/download/download_web.dart';

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
          loading: Loading.shimmer,
          error: ErrWidget.new,
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
                                value: () {
                                  final event = ref
                                      .read(eventProvider(eventId: eventId))
                                      .valueOrNull;

                                  download(images[index],
                                      downloadName:
                                          '${event == null ? DateTime.now().toString() : event.id}.jpg');
                                },
                                child: const Text('Download'),
                              ),
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
