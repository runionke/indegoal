import 'dart:async';

import 'package:flutter/material.dart';
import 'package:indegoal/lib.dart';

class GoalInput<T> extends StatefulWidget {
  const GoalInput({
    super.key,
    required this.input,
    required this.label,
    required this.initialValue,
    required this.onCancel,
    required this.onSave,
    required this.controller,
    this.saveDisplay,
    this.cancelDisplay,
  });

  final Function() onCancel;
  final Function(T) onSave;
  final T initialValue;
  final Widget label;
  final Widget Function(T) input;
  final StreamController<T> controller;

  final Widget? saveDisplay;
  final Widget? cancelDisplay;

  @override
  State<GoalInput<T>> createState() => _GoalInputState<T>();
}

class _GoalInputState<T> extends State<GoalInput<T>> {
  late T _value = widget.initialValue;
  StreamSubscription? sub;

  @override
  void initState() {
    super.initState();
    sub = widget.controller.stream.listen((event) {
      setState(() {
        _value = event;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    sub?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Editor(
        onCancel: widget.onCancel,
        onSave: () => widget.onSave(_value),
        cancelDisplay: widget.cancelDisplay ?? const Text('Back'),
        saveDisplay: widget.saveDisplay ?? const Text('Next'),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: widget.label,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(),
            ),
            widget.input(_value),
          ],
        ));
  }
}
