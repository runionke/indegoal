import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indegoal/lib.dart';
import 'package:printing/printing.dart';

class ExportPdfView extends ConsumerStatefulWidget {
  const ExportPdfView({super.key});

  @override
  ConsumerState<ExportPdfView> createState() => _ExportPdfViewState();
}

class _ExportPdfViewState extends ConsumerState<ExportPdfView> {
  DateTime fromDate = DateTime.now().subtract(const Duration(days: 30));
  DateTime toDate = DateTime.now();

  @override
  Widget build(BuildContext contextf) {
    return Scaffold(
        appBar: AppBar(title: const Text('Export')),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 60, child: Text('From: ')),
                      DateButton(
                          initialDate: fromDate,
                          onSave: (date) => setState(() => fromDate = date)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        const SizedBox(width: 60, child: Text('To:')),
                        DateButton(
                            initialDate: toDate,
                            onSave: (date) => setState(() => toDate = date)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () => ref
                            .watch(printNotifierProvider.notifier)
                            .printDateRange(fromDate, toDate),
                        child: const Text('Export')),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(),
                  )
                ],
              ),
            ),
            ref.watch(printNotifierProvider).when(
                complete: (report) => Expanded(
                      child: PdfPreview(
                          canChangePageFormat: false,
                          canChangeOrientation: false,
                          canDebug: false,
                          build: (format) => report),
                    ),
                standby: () => const SizedBox(),
                running: () => const CircularProgressIndicator(),
                noData: () => const Text('No events to export')),
          ],
        ));
  }
}
