import 'package:flutter/material.dart';

class BasicBox extends StatelessWidget {
  const BasicBox({super.key, required this.child, this.maxWidth = 500});
  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Card(
            color: Theme.of(context).dialogBackgroundColor,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: child));
  }
}
