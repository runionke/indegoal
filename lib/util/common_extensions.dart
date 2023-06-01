import 'package:flutter/material.dart';

extension DateExtensions on DateTime {
  DateTime get midnight => DateTime(year, month, day);
  bool sameDay(DateTime date) => date.year == year && date.day == day;
}

extension ColorExtensions on Color {
  String toHex({bool leadingHashSign = false, bool withAlpha = false}) =>
      '${leadingHashSign ? '#' : ''}'
              '${switch (withAlpha) {
        true => alpha.toRadixString(16).padLeft(2, '0'),
        false => '',
      }}'
              '${red.toRadixString(16).padLeft(2, '0')}'
              '${green.toRadixString(16).padLeft(2, '0')}'
              '${blue.toRadixString(16).padLeft(2, '0')}'
          .toUpperCase();
}
