import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:indegoal/lib.dart';
import 'package:intl/intl.dart';
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
      false => PrintJob.complete(await _printPdf(events)),
    };
  }

  Future<Uint8List> _printPdf(Iterable<Event> events) async {
    final colors = ColorScheme.fromSeed(seedColor: Colors.deepPurple);
    final pdf = pw.Document();
    //retrieve images for event
    final eventImages = await Future.wait(events.map(
        (e) async => (await ref.watch(eventImagesProvider(event: e).future))));

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Table(
              children: events
                  .mapIndexed((i, e) => pw.TableRow(
                          decoration: pw.BoxDecoration(
                              color: i.isOdd
                                  ? PdfColor.fromHex(colors.primary.toHex)
                                  : PdfColor.fromHex(colors.secondary.toHex)),
                          children: [
                            pw.Text(DateFormat.yMEd().format(e.time)),
                            pw.Text(e.duration.toString()),
                            pw.Row(
                              children: eventImages[i]
                                  .map((e) => pw.Padding(
                                      padding: const pw.EdgeInsets.all(8),
                                      child: pw.Image(
                                        pw.MemoryImage(e),
                                        height: 30,
                                        width: 30,
                                      )))
                                  .toList(),
                            )
                          ]))
                  .toList());
        }));

    return pdf.save();
  }
}
