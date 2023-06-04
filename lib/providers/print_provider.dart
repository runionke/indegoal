import 'package:indegoal/lib.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

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
      false => PrintJob.complete(await UsageReport(
              user: switch (ref.watch(authNotifierProvider)) {
                Authorized(:final user) => user,
                _ => throw Exception('User not unauthenticated'),
              },
              colors: ref.watch(themeNotifierProvider).colorScheme)
          .print(events, from, to)),
    };
  }
}
