import 'package:flutter/material.dart';
import 'package:indegoal/lib.dart';

class Device extends InheritedWidget {
  const Device({
    super.key,
    required this.device,
    required super.child,
  });

  final DeviceType device;

  static Device? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Device>();
  }

  static Device of(BuildContext context) {
    final Device? result = maybeOf(context);
    assert(result != null, 'No Device found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(Device oldWidget) => device != oldWidget.device;
}
