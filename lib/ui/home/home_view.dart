import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indegoal/lib.dart';
import 'package:indegoal/ui/home/no_goal.dart';
import 'package:indegoal/widgets/err_widget.dart';

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
          data: (goals) => Stack(
            children: [
              if (goals.isEmpty) const NoGoal(),
            ],
          ),
        );
  }
}
