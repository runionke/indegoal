import 'package:flutter/material.dart';

class Wizard extends StatefulWidget {
  const Wizard({
    super.key,
    required this.steps,
    this.onComplete,
    this.onCancel,
    required this.builder,
    this.outtrow,
  });

  final void Function()? onCancel;
  final void Function()? onComplete;
  final Widget Function(
    BuildContext context,
    Widget step,
    void Function() previous,
    void Function() next,
    int index,
  ) builder;
  final List<WizardStep> steps;

  ///shown after complete
  final Widget Function()? outtrow;

  @override
  State<Wizard> createState() => _WizardState();
}

class _WizardState<T extends Object> extends State<Wizard> {
  int stepIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (stepIndex < 0 || stepIndex > widget.steps.length - 1) {
      return widget.outtrow != null
          ? widget.outtrow!()
          : const SizedBox.shrink();
    }

    return widget.builder(
      context,
      widget.steps[stepIndex],
      () => setState(() {
        stepIndex--;
        if (stepIndex < 0 && widget.onCancel != null) {
          widget.onCancel!();
        }
      }),
      () {
        if (widget.steps[stepIndex].valid == null ||
            widget.steps[stepIndex].valid!<T>()) {
          setState(() {
            stepIndex++;
            if (stepIndex == widget.steps.length && widget.onComplete != null) {
              widget.onComplete!();
            }
          });
        }
      },
      stepIndex,
    );
  }
}

class WizardStep extends StatelessWidget {
  const WizardStep({
    super.key,
    required this.builder,
    this.valid,
  });
  final Widget Function(BuildContext context) builder;

  final bool Function<T>()? valid;

  @override
  Widget build(BuildContext context) {
    return builder(context);
  }
}
