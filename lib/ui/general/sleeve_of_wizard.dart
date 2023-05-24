import 'package:flutter/material.dart';

///common application level wizard wrappings
class SleeveOfWizard extends StatelessWidget {
  const SleeveOfWizard({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 400),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }
}
