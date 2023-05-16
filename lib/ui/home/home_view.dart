import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:indegoal/lib.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
        body: ref.watch(authNotifierProvider).when(
              loading: () => const Text('Loading'),
              unauthorized: () => const Text('unauthorized'),
              authorized: (user) => Row(
                children: [
                  Text(user.email),
                  TextButton(
                      onPressed: () => ref
                          .watch(goalNotifierProvider.notifier)
                          .create(Goal(
                              id: 'abc',
                              minutes: 33,
                              period: 45,
                              recurring: false,
                              start: DateTime.now(),
                              userId: 'bb@bb.v')),
                      child: const Text('create')),
                  TextButton(
                      onPressed: () => context.go('/cgoal'),
                      child: const Text('goal')),
                  TextButton(
                      onPressed:
                          ref.watch(authNotifierProvider.notifier).logout,
                      child: const Text('logout'))
                ],
              ),
            ));
  }
}
