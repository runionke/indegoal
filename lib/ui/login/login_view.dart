import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indegoal/ui/login/app_logo.dart';
import 'package:indegoal/ui/login/google_signin_button.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(28.0),
                child: AppLogo(),
              ),
              GoogleSigninButton()
            ],
          ),
        ),
      ),
    );
  }
}
