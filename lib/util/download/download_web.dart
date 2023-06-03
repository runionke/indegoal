import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

///downloads a file in the web browser with given file name
void download(
  List<int> bytes, {
  String? downloadName,
}) {
  // Encode our file in base64
  final base64 = base64Encode(bytes);
  // Create the link with the file
  final anchor =
      AnchorElement(href: 'data:application/octet-stream;base64,$base64')
        ..target = 'blank';
  // add the name
  if (downloadName != null) {
    anchor.download = downloadName;
  }
  // trigger download
  document.body?.append(anchor);
  anchor.click();
  anchor.remove();
  return;
}
