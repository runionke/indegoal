import 'package:flutter/material.dart';
import 'package:indegoal/lib.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

///Allows access to theme outside of context, like reporting.
///Provides a means to update state of theme (light / dark)
@Riverpod(keepAlive: true)
class ThemeNotifier extends _$ThemeNotifier {
  @override
  ThemeData build() {
    final scheme = ColorScheme.fromSeed(
        brightness: Brightness.light, seedColor: Colors.deepPurple);
    return ThemeData(
        colorScheme: scheme,
        useMaterial3: true,
        scaffoldBackgroundColor: scheme.background,
        extensions: const [ModalTheme.light]);
  }

  void setColorScheme(ColorScheme scheme) {
    state = state.copyWith(colorScheme: scheme);
  }

  void setBrightness(Brightness brightness) {
    state = state.copyWith(
        colorScheme: ColorScheme.fromSeed(
            seedColor: state.colorScheme.primary, brightness: brightness),
        extensions: [
          brightness == Brightness.light ? ModalTheme.light : ModalTheme.dark
        ]);
  }
}
