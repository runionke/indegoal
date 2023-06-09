import 'package:appwrite/appwrite.dart';
import 'package:collection/collection.dart';
import 'package:indegoal/lib.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'goal_provider.g.dart';

///goals sorted by end date
@Riverpod(keepAlive: true)
class GoalNotifier extends _$GoalNotifier {
  @override
  Future<Iterable<Goal>> build() async {
    Log.d('GoalNotifier-> build');

    final data = (await ref.watch(appwriteProvider.notifier).list(
        collection: DbCollection.goals,
        queries: [Query.equal('active', true)]));

    return data.map((e) => Goal.fromJson(e));
  }

  ///add to database
  Future<void> create(Goal goal) async {
    Log.d('GoalNotifier -> create $goal');
    final id = await ref
        .watch(appwriteProvider.notifier)
        .create(data: goal.toJson(), collection: DbCollection.goals);

    state =
        AsyncValue.data((await future).toList()..add(goal.copyWith(id: id)));
  }

  ///delete from database
  Future<void> delete(String id) async {
    await ref
        .watch(appwriteProvider.notifier)
        .delete(id: id, collection: DbCollection.goals);
    ref.invalidateSelf();
  }

  Future<void> deactivate(Goal goal) async {
    state = const AsyncValue.loading();
    await ref.watch(appwriteProvider.notifier).write(
        id: goal.id,
        collection: DbCollection.goals,
        data: goal.copyWith(active: false).toJson());
    ref.invalidateSelf();
  }
}

extension IterableGoalExtension on Iterable<Goal> {
  Iterable<Goal> get active =>
      where((element) => element.active && element.end.isAfter(DateTime.now()));
  Iterable<Goal> get sortByEnd => sorted((a, b) => b.end.compareTo(a.end));
  Goal? withId(String id) => firstWhereOrNull((element) => element.id == id);
}
