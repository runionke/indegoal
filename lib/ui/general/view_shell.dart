import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';

class ViewShell extends StatelessWidget {
  const ViewShell({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Portal(
        child: Scaffold(
            appBar: AppBar(title: const Text('IndeGoal')), body: child));
  }
}
