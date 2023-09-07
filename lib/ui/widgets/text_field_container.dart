import 'package:flutter/material.dart';

class TextFieldContainer extends StatefulWidget {
  const TextFieldContainer({
    super.key,
    required this.builder,
  });

  final Widget Function(TextEditingController controller) builder;

  @override
  State<TextFieldContainer> createState() => _TextFieldContainerState();
}

class _TextFieldContainerState extends State<TextFieldContainer> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return widget.builder(controller);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
