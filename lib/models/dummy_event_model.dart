import 'dart:ffi';

import 'dart:typed_data';

class EventDetailModel {
  EventDetailModel({
    required this.title,
    required this.institutions,
    required this.time,
    required this.image,
  });
  final String title;
  final String institutions;
  final String time;
  final Uint8List image;
}
