import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';

///Modal window that displays based on state stream.
class PortalModal<T> extends StatelessWidget {
  const PortalModal(
      {super.key,
      required this.child,
      this.padding,
      this.radius,
      this.maxHeight,
      this.maxWidth,
      this.backgroundOpacity = 0.3,
      this.modalOpacity = 0.5,
      required this.onCancel});

  ///Called when clicking out of bounds.
  final Function() onCancel;

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? radius;
  final double backgroundOpacity;
  final double modalOpacity;
  final double? maxHeight, maxWidth;

  @override
  Widget build(BuildContext context) {
    return PortalTarget(
      visible: true,
      anchor: const Filled(),
      portalFollower: BasicModal(
          onCancel: onCancel,
          backgroundOpacity: backgroundOpacity,
          modalOpacity: modalOpacity,
          radius: radius,
          maxHeight: maxHeight,
          maxWidth: maxWidth,
          child: child),
      child: const SizedBox.shrink(),
    );
  }
}

class BasicModal extends StatelessWidget {
  const BasicModal({
    super.key,
    required this.onCancel,
    this.backgroundOpacity = 0.3,
    this.modalOpacity = 0.5,
    this.radius,
    this.maxHeight,
    this.maxWidth,
    required this.child,
  });

  final Function() onCancel;
  final double backgroundOpacity;
  final double modalOpacity;
  final BorderRadiusGeometry? radius;
  final double? maxHeight;
  final double? maxWidth;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onCancel,
          child: Container(
            color: Colors.black.withOpacity(backgroundOpacity),
          ),
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context)
                    .colorScheme
                    .background
                    .withOpacity(modalOpacity),
                borderRadius: radius ?? BorderRadius.circular(10)),
            child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: maxHeight ?? double.infinity,
                    maxWidth: maxWidth ?? double.infinity),
                child: child),
          ),
        )
      ],
    );
  }
}
