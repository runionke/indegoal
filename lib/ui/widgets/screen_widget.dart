import 'package:flutter/material.dart';

class ScreenWidget extends StatelessWidget {
  const ScreenWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
    );
  }
}
