import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:indegoal/lib.dart';

class NoGoal extends StatelessWidget {
  const NoGoal({super.key});

  @override
  Widget build(BuildContext context) {
    return PortalModal(
        child: InkWell(
          onTap: () => context.go('/cgoal'),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 200,
              minWidth: 300,
            ),
            child: const Padding(
              padding: EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('You do don\'t have any active goals set.'),
                  Text(' Tap anywhere to create a new one.'),
                ],
              ),
            ),
          ),
        ),
        onCancel: () {});
  }
}
