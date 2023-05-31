import 'dart:typed_data';

import 'package:flutter/material.dart';

class ImageThumbnail extends StatelessWidget {
  const ImageThumbnail({
    super.key,
    required this.bytes,
  });
  final Uint8List bytes;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Image.memory(
          bytes,
          fit: BoxFit.cover,
        ));
  }
}
