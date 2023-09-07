import 'package:flutter/material.dart';

class ModalTheme extends ThemeExtension<ModalTheme> {
  const ModalTheme({required this.container, required this.borderRadius});

  final Color? container;
  final BorderRadius? borderRadius;

  static const light = ModalTheme(
    container: Color.fromARGB(110, 206, 206, 206),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );

  static const dark = light;

  @override
  ThemeExtension<ModalTheme> copyWith(
      {Color? container, BorderRadius? borderRadius}) {
    return ModalTheme(
      container: container ?? this.container,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  ThemeExtension<ModalTheme> lerp(
      covariant ThemeExtension<ModalTheme>? other, double t) {
    if (other is! ModalTheme) {
      return this;
    }
    return ModalTheme(
      container: Color.lerp(container, other.container, t),
      borderRadius: BorderRadius.lerp(borderRadius, other.borderRadius, t),
    );
  }

  @override
  String toString() {
    return 'ModalTheme(decoration: $container,)';
  }
}
