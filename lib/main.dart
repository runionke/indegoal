import 'package:flutter/material.dart';
import 'package:indegoal/lib.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indegoal/providers/theme_provider.dart';

void main() {
  usePathUrlStrategy();
  Log();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final router = ref.watch(routerProvider);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Device(
          device: constraints.maxWidth > 600
              ? const DeviceType.small()
              : const DeviceType.large(),
          child: MaterialApp.router(
            title: 'indegoal',
            debugShowCheckedModeBanner: false,
            routeInformationProvider: router.routeInformationProvider,
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
            theme: ref.watch(themeNotifierProvider),
          ),
        );
      },
    );
  }
}
