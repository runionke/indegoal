import 'package:flutter/material.dart';

class GoalStart extends StatefulWidget {
  const GoalStart({super.key, required this.onCancel, required this.onSave});
  final Function() onCancel;
  final Function(DateTime) onSave;

  @override
  State<GoalStart> createState() => _GoalStartState();
}

class _GoalStartState extends State<GoalStart> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('${selectedDate.toLocal()}'.split(' ')[0]),
        const SizedBox(
          height: 20.0,
        ),
        ElevatedButton(
          onPressed: () => _selectDate(context),
          child: const Text('Select date'),
        ),
      ],
    );
  }
}
