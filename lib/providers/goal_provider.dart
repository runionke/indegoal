import 'package:indegoal/lib.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'goal_provider.g.dart';

@Riverpod(keepAlive: true)
class GoalNotifier extends _$GoalNotifier {
  @override
  Future<Iterable<Goal>> build() async {
    Log.d('GoalNotifier-> build');

    final data = await ref
        .watch(appwriteProvider.notifier)
        .list(collection: DbCollection.goals);
    return data.map((e) => Goal.fromJson(e));
  }

  Future<void> add(Goal goal) async {
    await ref.watch(appwriteProvider.notifier).create(
        data: goal.toJson(), id: goal.id, collection: DbCollection.goals);
    ref.invalidateSelf();
  }

  Future<void> delete(String id) async {
    await ref
        .watch(appwriteProvider.notifier)
        .delete(id: id, collection: DbCollection.goals);
    ref.invalidateSelf();
  }
}
