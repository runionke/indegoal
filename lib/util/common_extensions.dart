import 'package:flutter/material.dart';

extension DateExtensions on DateTime {
  DateTime get midnight => DateTime(year, month, day);
  bool sameDay(DateTime date) => date.year == year && date.day == day;
}

extension ColorExtensions on Color {
  String get toHex => '#${value.toRadixString(16)}';
}