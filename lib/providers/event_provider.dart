import 'dart:typed_data';

import 'package:appwrite/appwrite.dart';
import 'package:collection/collection.dart';
import 'package:indegoal/lib.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'event_provider.g.dart';

/// [from] and [to] range take precedent over [goal] range
@Riverpod(keepAlive: true)
class EventNotifier extends _$EventNotifier {
  @override
  Future<Iterable<Event>> build(
      {Goal? goal, DateTime? fromDate, DateTime? toDate}) async {
    Log.d('EventNotifier-> build');

    fromDate ??= goal?.start;
    toDate ??= goal?.end;
    Log.d(
        'Event Notifier between: ${fromDate?.midnight.toIso8601String()} -  ${toDate?.midnight.toIso8601String()})');

    final data = await ref
        .watch(appwriteProvider.notifier)
        .list(collection: DbCollection.events, queries: [
      if (fromDate != null)
        Query.greaterThanEqual('time', fromDate.toIso8601String()),
      if (toDate != null)
        Query.lessThanEqual('time', toDate.midnight.toIso8601String()),
    ]);

    Log.d('Events retrieved from db: ${data.length}');
    //between("time", [2023-05-25 09:45:36.377,2023-05-25 09:45:36.377]
    //queries: goalId != null ? ['equal("\$id", ["$goalId}"])'] : null
    return data.map((e) => Event.fromJson(e));
  }

  ///add event to database and upload images to storage
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

  Future<void> save(Event event) async {
    await ref.watch(appwriteProvider.notifier).write(
        collection: DbCollection.events, id: event.id, data: event.toJson());

    //update notifier state with this changed event
    final events = await future;
    state = AsyncValue.data(
        events.toList().where((element) => element.id != event.id).toList()
          ..add(event));

    //refresh any event listeners
    ref.invalidate(eventProvider(eventId: event.id));
  }

  ///remove image using the eventId and position in the photos list.
  Future<void> removeImage(String eventId, int imageIndex) async {
    final event = await ref.read(eventProvider(eventId: eventId).future);
    final imageId = event.photos[imageIndex];

    await ref.watch(appwriteProvider.notifier).deleteFromStorage(
        fileId: imageId, bucketId: AppwriteSettings.eventImageBucket);
    await save(event.copyWith(
        photos: event.photos.where((element) => element != imageId).toList()));
    ref.invalidate(eventNotifierProvider); //invalidate the entire family
  }

  Future<void> delete(String id) async {
    //update the state remove the deleted element
    state = AsyncValue.data(
        (await future).toList().where((element) => element.id != id));
    //state updated first so the ui is updated when the modal pops
    await ref
        .watch(appwriteProvider.notifier)
        .delete(id: id, collection: DbCollection.events);
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

///accepts [event], or [eventId]
@riverpod
Future<List<Uint8List>> eventImages(
  EventImagesRef ref, {
  Event? event,
  String? eventId,
  double? height = 50,
  double? width = 50,
}) async {
  event ??= await ref.watch(eventProvider(eventId: eventId!).future);
  return (await ref.watch(appwriteProvider.notifier).previewFromStorage(
          bucketId: AppwriteSettings.eventImageBucket,
          items: event!.photos,
          height: height,
          width: width))
      .toList();
}

///event from [goalId]
@riverpod
Future<Event> event(
  EventRef ref, {
  required String eventId,
}) async {
  final event = await ref
      .watch(appwriteProvider.notifier)
      .read(collectionId: DbCollection.events, id: eventId);
  return Event.fromJson(event);
}
