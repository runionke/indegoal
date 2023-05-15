import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indegoal/lib.dart';

class GoogleSigninButton extends ConsumerWidget {
  const GoogleSigninButton({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Tooltip(
      message: 'Sign in with Google',
      child: IconButton(
          onPressed: () =>
              ref.watch(authNotifierProvider.notifier).googleAuth(),
          icon: Image.asset(
              'assets/signin/google/btn_google_signin_light_normal_web.png')),
    );
  }
}
