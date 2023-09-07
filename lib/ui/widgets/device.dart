import 'package:flutter/material.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'device.freezed.dart';

@freezed
sealed class DeviceType with _$DeviceType {
  const factory DeviceType.small() = SmallDevice;
  const factory DeviceType.large() = LargeDevice;
}

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
