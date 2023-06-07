import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:indegoal/lib.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 5.0),
                child: AppIcon(
                  width: 35,
                  height: 35,
                ),
              ),
              Text('IndeGoal'),
            ],
          ),
        ),

        //the notifier is being watched 3 times like this so that
        //at least the appbar loads during the loading phase.
        //could also have returned a separate scaffold in loading. and just used
        //a top level goalNotifierProvider
        endDrawer: Drawer(
          width: 120,
          child: ref.watch(goalNotifierProvider).when(
              loading: () => const Loading(),
              error: (error, stackTrace) => ErrWidget(error),
              data: (goals) => RightDrawer(goal: goals.active.firstOrNull)),
        ),
        body: ref.watch(goalNotifierProvider).when(
              loading: () => const Loading(),
              error: (error, stackTrace) => ErrWidget(error),
              data: (goals) => ColoredBox(
                color: Theme.of(context).colorScheme.background,
                child: switch (goals.active.isEmpty) {
                  true => const NoGoal(),
                  false => GoalView(goals.active.sortByEnd.first),
                },
              ),
            ),
        floatingActionButton: ref.watch(goalNotifierProvider).when(
              loading: () => const Loading(),
              error: (error, stackTrace) => ErrWidget(error),
              data: (goals) => goals.active.isNotEmpty
                  ? FloatingActionButton.large(
                      tooltip: 'Add Event',
                      child: const Icon(Icons.add),
                      onPressed: () => context
                          .push('/cevent/${goals.active.sortByEnd.first.id}'),
                    )
                  : null,
            ));
  }
}
