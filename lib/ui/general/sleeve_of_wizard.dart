import 'package:flutter/material.dart';
import 'package:indegoal/lib.dart';

///common application level wizard wrappings
class SleeveOfWizard extends StatelessWidget {
  const SleeveOfWizard({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.background,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: switch (Device.of(context).device) {
            SmallDevice() => 400,
            LargeDevice() => double.infinity,
          }),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
