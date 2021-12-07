import 'dart:typed_data';

import 'package:flutter_donor/models/event_image_model.dart';

import 'package:flutter_donor/shared/constant.dart';
import 'package:http/http.dart';

class EventImageServices {
  static Future<EventImageModel> eventImageServices({
    required String link,
    required String token,
  }) async {
    Response _response = await get(
      Uri.parse("http://" + link),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    return EventImageModel(file: _response.bodyBytes);
  }
}
