import 'package:flutter/material.dart';
import 'package:indegoal/lib.dart';
import 'package:numberpicker/numberpicker.dart';

class GoalLength extends StatefulWidget {
  const GoalLength({
    super.key,
    required this.onCancel,
    required this.onSave,
  });

  final Function() onCancel;
  final Function(int) onSave;
  @override
  State<GoalLength> createState() => _GoalLengthState();
}

class _GoalLengthState extends State<GoalLength> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Editor(
        onCancel: widget.onCancel,
        onSave: () => widget.onSave(_value),
        cancelDisplay: const Text('Back'),
        saveDisplay: const Text('Next'),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Flexible(
                child: Text('Select the number of days to reach your goal.')),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(),
            ),
            NumberPicker(
              value: _value,
              minValue: 0,
              maxValue: 100,
              onChanged: (value) => setState(() => _value = value),
            ),
          ],
        ));
  }
}
