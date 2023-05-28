import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:indegoal/lib.dart';

class RightDrawer extends ConsumerWidget {
  const RightDrawer({
    super.key,
    required this.goal,
  });

  final Goal? goal;

  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (goal != null)
            TextButton(
                onPressed: () {
                  context.pop();
                  context.push('/hist/${goal?.id}');
                },
                child: const Text('Event History')),
          const Divider(),
          TextButton(
              onPressed: () =>
                  ref.watch(authNotifierProvider.notifier).logout(),
              child: const Text('Logout'))
        ],
      ),
    );
  }
}
