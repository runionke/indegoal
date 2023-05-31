import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'print.freezed.dart';

@freezed
class PrintJob with _$PrintJob {
  const factory PrintJob.complete(Uint8List report) = PrintJobComplete;
  const factory PrintJob.standby() = PrintJobStandby;
  const factory PrintJob.running() = PrintJobRunning;
  const factory PrintJob.noData() = PrintJobNoData;
}
