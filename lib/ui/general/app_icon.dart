import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    super.key,
    this.width,
    this.height,
  });
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      'assets/general/Icon.png',
      width: width,
      height: height,
    );
  }
}
