import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';

import 'modal_theme.dart';

///animated error popup displays [child] for [duration] when [visible]
class ErrorModal extends StatefulWidget {
  const ErrorModal({
    super.key,
    required this.child,
    this.duration,
    required this.visible,
  });

  final Widget child;
  final Duration? duration;
  final bool visible;

  @override
  State<ErrorModal> createState() => _ErrorModalState();
}

class _ErrorModalState extends State<ErrorModal> {
  bool isVisible = true;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    //timer that disables after duration
    if (widget.duration != null) {
      timer = Timer(widget.duration!, () {
        setState(() {
          isVisible = false;
        });
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ModalTheme>()!;
    return PortalTarget(
      visible: true,
      anchor: const Filled(),
      portalFollower: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: widget.visible && isVisible ? 1 : 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: theme.borderRadius,
                color: theme.container,
              ),
              constraints: const BoxConstraints(maxHeight: 100, maxWidth: 200),
              child: Center(child: widget.child),
            ),
          ),
        ),
      ),
      child: const SizedBox.shrink(),
    );
  }
}
