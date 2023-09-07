import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({
    super.key,
    required this.title,
    required this.foreLabel,
    required this.backLabel,
    required this.value,
    required this.max,
  });

  final String title;
  final String foreLabel;
  final String backLabel;
  final double value;
  final double max;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(title),
          ),
          Expanded(
            child: SizedBox(
              height: 20,
              child: DChartSingleBar(
                foregroundLabel: Text(
                  foreLabel,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                ),
                backgroundLabel: Text(backLabel),
                backgroundColor: Colors.grey,
                foregroundColor: Theme.of(context).colorScheme.primary,
                value: value,
                max: max,
                radius: const BorderRadius.all(Radius.circular(8)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
