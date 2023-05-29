import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indegoal/lib.dart';

///Navigated to after auth sign on
class AuthComplete extends ConsumerWidget {
  const AuthComplete({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
              child: Card(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Flexible(
                    child: ref.watch(authNotifierProvider).when(
                          authorized: (user) => const Text(
                              'You\'ve been signed in. You can now close this window.'),
                          unauthorized: () => const Text(
                              'We were unable to sign in. You can close this window and attempt again.'),
                          loading: () =>
                              const Text('Signing you in. One moment please.'),
                        ),
                  ),
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
