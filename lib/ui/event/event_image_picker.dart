import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EventImagePicker extends StatefulWidget {
  const EventImagePicker({super.key, required this.onPick});
  final void Function(List<Uint8List> images) onPick;

  @override
  State<EventImagePicker> createState() => _EventImagePickerState();
}

class _EventImagePickerState extends State<EventImagePicker> {
  final List<XFile> images = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          children: [
            ...images.map((e) => FutureBuilder<Uint8List>(
                  future: e.readAsBytes(),
                  builder: (context, snapshot) => snapshot.hasData
                      ? Image.memory(
                          snapshot.data!,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )
                      : const SizedBox.shrink(),
                ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    images.addAll(await ImagePicker().pickMultiImage());
                    widget.onPick(
                        await Future.wait(images.map((e) => e.readAsBytes())));
                    setState(() {});
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.image),
                        Text('Add Images'),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
