import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.3)),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 18.0,
              horizontal: 30,
            ),
            child:
                Text('IndeGoal', style: Theme.of(context).textTheme.titleLarge),
          ),
        ),
      ],
    );
  }
}
