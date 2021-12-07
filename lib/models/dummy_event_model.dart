import 'dart:ffi';

import 'dart:typed_data';

class EventDetailModel {
  EventDetailModel({
    required this.title,
    required this.desc,
    required this.image,
  });
  final String title;
  final String desc;
  final Uint8List image;
}
