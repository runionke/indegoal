import 'package:indegoal/lib.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'event_provider.g.dart';

@Riverpod(keepAlive: true)
class EventNotifier extends _$EventNotifier {
  @override
  Future<Iterable<Event>> build() async {
    Log.d('EventNotifier-> build');

    final data = await ref
        .watch(appwriteProvider.notifier)
        .list(collection: DbCollection.events);
    return data.map((e) => Event.fromJson(e));
  }

  Future<void> create(Event event) async {
    await ref
        .watch(appwriteProvider.notifier)
        .create(data: event.toJson(), collection: DbCollection.events);
    ref.invalidateSelf();
  }

  Future<void> delete(String id) async {
    await ref
        .watch(appwriteProvider.notifier)
        .delete(id: id, collection: DbCollection.events);
    ref.invalidateSelf();
  }
}
