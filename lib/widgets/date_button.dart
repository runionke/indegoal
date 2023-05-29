import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateButton extends StatefulWidget {
  const DateButton({super.key, required this.onSave});
  final Function(DateTime) onSave;

  @override
  State<DateButton> createState() => _DateButtonState();
}

class _DateButtonState extends State<DateButton> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.onSave(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _selectDate(context),
      child: Text(
        DateFormat.yMd().add_jm().format(selectedDate),
        textScaleFactor: 2.5,
      ),
    );
  }
}
