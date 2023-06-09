import 'dart:typed_data';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:indegoal/lib.dart';

class UsageReport {
  const UsageReport({
    required this.user,
    required this.colors,
  });

  final ColorScheme colors;
  final User user;

  Future<Uint8List> print(
    Iterable<Event> events,
    DateTime dateFrom,
    DateTime dateTo,
  ) {
    final pdf = pw.Document();
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
                pw.Text(user.email),
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
                pw.Text((events.groupTotaled.length + 1).toString()),
                pw.Text(events.minutes.toString())
              ]),
            ])
          ]);
        }));

    return pdf.save();
  }
}
