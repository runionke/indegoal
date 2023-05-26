import 'package:freezed_annotation/freezed_annotation.dart';

part 'device.freezed.dart';

@freezed
sealed class DeviceType with _$DeviceType {
  const factory DeviceType.small() = SmallDevice;
  const factory DeviceType.large() = LargeDevice;
}
