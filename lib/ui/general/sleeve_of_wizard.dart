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
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxHeight: switch (Device.of(context).device) {
          SmallDevice() => double.infinity,
          LargeDevice() => 400,
        }),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: child,
        ),
      ),
    );
  }
}
