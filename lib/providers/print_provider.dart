import 'dart:typed_data';

import 'package:indegoal/lib.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

part 'print_provider.g.dart';

@riverpod
class PrintNotifier extends _$PrintNotifier {
  @override
  PrintJob build() {
    Log.d('PrintNotifier-> build');
    return const PrintJob.standby();
  }

  Future<void> printDateRange(DateTime from, DateTime to) async {
    state = const PrintJob.running();

    final events = await ref
        .watch(eventNotifierProvider(fromDate: from, toDate: to).future);

    state = switch (events.isEmpty) {
      true => const PrintJob.noData(),
      false => PrintJob.complete(await printPdf(events)),
    };
  }
}

Future<Uint8List> printPdf(Iterable<Event> events) {
  final pdf = pw.Document();

  pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Column(
          children: [
            ...events.map((e) => pw.Text('event: ${e.time}')),
            pw.Text("Test Test"),
          ],
        );
      }));
  return pdf.save();
}
