import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Loading extends StatelessWidget {
  const Loading({super.key, this.child, this.baseColor, this.highlightColor})
      : shimmer = false;
  const Loading.shimmer({
    super.key,
    this.child,
    this.baseColor,
    this.highlightColor,
  }) : shimmer = true;

  final Widget? child;
  final bool shimmer;
  final Color? baseColor, highlightColor;
  @override
  Widget build(BuildContext context) {
    return switch (shimmer) {
      false => child ?? const SizedBox.shrink(),
      true => Shimmer.fromColors(
          baseColor: baseColor ?? Colors.grey.shade300,
          highlightColor: highlightColor ?? Colors.grey.shade100,
          child: child ?? const Card(child: SizedBox.expand())),
    };
  }
}
