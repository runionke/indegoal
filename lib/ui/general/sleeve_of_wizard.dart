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
    final device = Device.of(context).device;
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxHeight: switch (device) {
          SmallDevice() => 400,
          LargeDevice() => double.infinity,
        }),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: child,
        ),
      ),
    );
  }
}
