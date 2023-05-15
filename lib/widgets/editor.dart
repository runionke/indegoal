import 'package:flutter/material.dart';
import 'basic_box.dart';

class Editor extends StatelessWidget {
  const Editor({
    super.key,
    this.label,
    this.onSave,
    required this.onCancel,
    required this.child,
    this.saveDisplay,
    this.cancelDisplay,
  });

  final String? label;
  final Function()? onSave;
  final Function() onCancel;
  final Widget? saveDisplay;
  final Widget? cancelDisplay;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BasicBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (label != null)
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  label!,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(decoration: TextDecoration.underline),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: child,
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: onCancel,
                  child: cancelDisplay ?? const Text('Cancel')),
              if (onSave != null)
                TextButton(
                    onPressed: onSave,
                    child: saveDisplay ?? const Text('Save')),
            ],
          ),
        ],
      ),
    );
  }
}
