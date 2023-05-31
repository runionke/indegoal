import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indegoal/lib.dart';
import 'package:printing/printing.dart';

class ExportPdfView extends ConsumerWidget {
  const ExportPdfView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
        appBar: AppBar(title: const Text('Export')),
        body: Column(
          children: [
            Row(
              children: [
                TextButton(
                    onPressed: () => ref
                        .watch(printNotifierProvider.notifier)
                        .printDateRange(
                            DateTime.now().subtract(const Duration(days: 30)),
                            DateTime.now()),
                    child: const Text('Export'))
              ],
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
