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
      false => PrintJob.complete(await _printPdf(events, from, to)),
    };
  }

  Future<Uint8List> _printPdf(
      Iterable<Event> events, DateTime dateFrom, DateTime dateTo) async {
    final colors = ColorScheme.fromSeed(seedColor: Colors.deepPurple);
    final pdf = pw.Document();
    //retrieve images for event
    //decided not to use images here and just allow download
    // final eventImages = await Future.wait(events.map((e) async =>
    //     (await ref.watch(
    //         eventImagesProvider(event: e, height: 200, width: 200).future))));

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.standard,
        build: (pw.Context context) {
          return pw.Column(children: [
            //heading
            pw.Column(mainAxisSize: pw.MainAxisSize.min, children: [
              pw.Row(children: [
                pw.SizedBox(
                  width: 140,
                  child: pw.Text('Range Operation:'),
                ),
                pw.Text(
                    '${DateFormat.yMd().format(dateFrom)} - ${DateFormat.yMd().format(dateTo)}'),
              ]),
              pw.Row(children: [
                pw.SizedBox(
                  width: 140,
                  child: pw.Text('Operator:'),
                ),
                pw.Text(switch (ref.watch(authNotifierProvider)) {
                  Authorized(:final user) => user.email,
                  _ => '',
                }),
                pw.SizedBox(height: 30),
              ]),
            ]),
            //bdy
            pw.Table(children: [
              //table heading
              pw.TableRow(
                  decoration: pw.BoxDecoration(
                    border: pw.Border(
                        bottom: pw.BorderSide(
                            width: 0.5,
                            color: PdfColor.fromHex(colors.tertiary.toHex()))),
                  ),
                  children: [pw.Text('Date'), pw.Text('Minutes Used')]),
              ...events
                  .mapIndexed((i, e) => pw.TableRow(
                          decoration: pw.BoxDecoration(
                              color: i.isOdd
                                  ? PdfColor.fromHex(colors.primary
                                      .lighten(amount: .40)
                                      .toHex())
                                  : PdfColor.fromHex(colors.secondary
                                      .lighten(amount: .55)
                                      .toHex())),
                          children: [
                            pw.Text(DateFormat.yMEd().format(e.time)),
                            pw.Text(e.duration.toString()),
                            // pw.Row(
                            //   children: eventImages[i]
                            //       .map((e) => pw.Padding(
                            //           padding: const pw.EdgeInsets.all(8),
                            //           child: pw.Image(
                            //             pw.MemoryImage(e),
                            //             // height: 30,
                            //             // width: 30,
                            //           )))
                            //       .toList(),
                            // )
                          ]))
                  .toList(),
              //spacer
              pw.TableRow(children: [
                pw.SizedBox(height: 10),
              ]),
              //totals
              pw.TableRow(
                  decoration: pw.BoxDecoration(
                      border: pw.Border(
                          top: pw.BorderSide(
                              width: 0.5,
                              color: PdfColor.fromHex(colors.tertiary.toHex())),
                          bottom: pw.BorderSide(
                              width: 0.5,
                              color:
                                  PdfColor.fromHex(colors.tertiary.toHex())))),
                  children: [pw.Text('Days Used'), pw.Text('Minutes Total')]),
              pw.TableRow(children: [
                pw.Text(events.groupTotaled.length.toString()),
                pw.Text(events.minutes.toString())
              ]),
            ])
          ]);
        }));

    return pdf.save();
  }
}
