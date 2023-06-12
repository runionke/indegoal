import 'package:flutter/material.dart';
import 'package:indegoal/lib.dart';

class ErrWidget extends StatefulWidget {
  const ErrWidget(
    this.error,
    this.stackTrace, {
    super.key,
  });

  final Object error;
  final StackTrace stackTrace;
  @override
  State<ErrWidget> createState() => _ErrWidgetState();
}

class _ErrWidgetState extends State<ErrWidget> {
  @override
  void initState() {
    super.initState();

    Log.d('ErrWidget: ${widget.error} : ${widget.stackTrace}');
  }

  @override
  Widget build(BuildContext context) {
    return Text(widget.error.toString());
  }
}
