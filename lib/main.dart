import 'package:flutter/material.dart';
import 'package:indegoal/lib.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  usePathUrlStrategy();
  Log();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Consumer(
        builder: (_, ref, __) {
          final router = ref.watch(routerProvider);
          return MaterialApp.router(
            title: 'indegoal',
            debugShowCheckedModeBanner: false,
            routeInformationProvider: router.routeInformationProvider,
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
                extensions: const [ModalTheme.light]),
          );
        },
      ),
    );
  }
}
