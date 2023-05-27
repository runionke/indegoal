import 'dart:typed_data';

import 'package:appwrite/appwrite.dart';
import 'package:collection/collection.dart';
import 'package:indegoal/lib.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:indegoal/util/date_utils.dart';
part 'event_provider.g.dart';

@Riverpod(keepAlive: true)
class EventNotifier extends _$EventNotifier {
  @override
  Future<Iterable<Event>> build({Goal? goal}) async {
    Log.d('EventNotifier-> build');

    if (goal != null) {
      Log.d(
          'Event Notifier with goal between: ${goal.start.midnight.toIso8601String()} -  ${goal.end.midnight.toIso8601String()})');
    }
    final data = await ref.watch(appwriteProvider.notifier).list(
        collection: DbCollection.events,
        queries: goal != null
            ? [
                Query.greaterThanEqual(
                  'time',
                  goal.start.midnight.toIso8601String(),
                ),
                Query.lessThanEqual(
                    'time', goal.end.midnight.toIso8601String()),
              ]
            : null);

    Log.d('Events retrieved from db: ${data.length}');
    //between("time", [2023-05-25 09:45:36.377,2023-05-25 09:45:36.377]
    //queries: goalId != null ? ['equal("\$id", ["$goalId}"])'] : null
    return data.map((e) => Event.fromJson(e));
  }

  Future<void> create(Event event, {List<Uint8List>? images}) async {
    final notifier = ref.watch(appwriteProvider.notifier);

    //upload images to storage and add id list to event
    if (images != null && images.isNotEmpty) {
      Log.d('EventProvider -> uploading images to storage');
      final imgList = await notifier.uploadToStorage(
          files: images, bucketId: AppwriteSettings.eventImageBucket);
      event = event.copyWith(photos: imgList.toList());
    }

    await notifier.create(
      data: event.toJson(),
      collection: DbCollection.events,
    );
    ref.invalidateSelf();
  }

  Future<void> delete(String id) async {
    await ref
        .watch(appwriteProvider.notifier)
        .delete(id: id, collection: DbCollection.events);
    ref.invalidateSelf();
  }
}

extension IterableEventExtension on Iterable<Event> {
  Iterable<Event> get sortByTime => sorted((a, b) => b.time.compareTo(a.time));

  int get minutes => fold<int>(
      0, (previousValue, element) => previousValue + element.duration);

  ///combines minutes that fall on same day, for proper charting
  Iterable<Event> get groupTotaled {
    final grouped = <Event>[];

    for (final event in sortByTime) {
      final last = grouped.lastOrNull;
      if (last != null && event.time.sameDay(last.time)) {
        grouped.remove(last);
        grouped.add(last.copyWith(duration: last.duration + event.duration));
      } else {
        grouped.add(event);
      }
    }
    return grouped;
  }
}

@riverpod
Future<List<Uint8List>> eventImages(EventImagesRef ref, Event event) async {
  return (await ref.watch(appwriteProvider.notifier).previewFromStorage(
          bucketId: AppwriteSettings.eventImageBucket,
          items: event.photos,
          height: 50,
          width: 50))
      .toList();
}
