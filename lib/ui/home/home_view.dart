import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:indegoal/lib.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return ref.watch(goalNotifierProvider).when(
        loading: () => const Loading(),
        error: (error, stackTrace) => ErrWidget(
              error,
              stackTrace: stackTrace,
            ),
        data: (goals) {
          final activeGoals = goals.active;
          return Scaffold(
            appBar: AppBar(title: const Text('IndeGoal')),
            body: Stack(
              children: [
                if (activeGoals.isEmpty) const NoGoal(),
                if (activeGoals.isNotEmpty)
                  GoalView(activeGoals.sortByEnd.first),
              ],
            ),
            floatingActionButton: activeGoals.isNotEmpty
                ? FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () =>
                        context.go('/cevent/${activeGoals.sortByEnd.first.id}'),
                  )
                : null,
          );
        });
  }
}
