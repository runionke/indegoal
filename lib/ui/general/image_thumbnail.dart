import 'dart:typed_data';

import 'package:flutter/material.dart';

class ImageThumbnail extends StatelessWidget {
  const ImageThumbnail({
    super.key,
    required this.bytes,
    this.width,
    this.height,
  });
  final Uint8List bytes;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Image.memory(
          bytes,
          width: width,
          height: height,
          fit: BoxFit.cover,
        ));
  }
}
