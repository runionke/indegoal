extension DateExtensions on DateTime {
  DateTime get midnight => DateTime(year, month, day);
  bool sameDay(DateTime date) => date.year == year && date.day == day;
}
